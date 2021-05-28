Shader "Unlit/ExpandNormalOutline"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _OutLineColor ("OutLineColor",Color) = (0,0,0,1)
        _OutLineHold ("OutLineHold",float) = 0.2
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        
        CGINCLUDE
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "AutoLight.cginc"
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
                float3 tangent :TANGENT;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float3 worldNormal : TEXCOORD1;
                float3 worldPos : TEXCOORD2;
                float3 realViewDir : TEXCOORD3;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _OutLineColor;
            fixed _OutLineHold;
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.realViewDir = (float3)normalize(_WorldSpaceCameraPos.xyz - mul(unity_ObjectToWorld, o.worldPos).xyz);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                

                return col;
            }
            v2f drawOutLineVert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                //fixed3 normal = mul((fixed3x3)UNITY_MATRIX_IT_MV, v.normal.xyz);
                float3 normal = mul((float3x3)UNITY_MATRIX_IT_MV, v.tangent.xyz);
                fixed2 expandDir = normalize(TransformViewToProjection(normal.xy));
                float4 nearUpperRight = mul(unity_CameraInvProjection,float4(1,1,UNITY_NEAR_CLIP_VALUE, _ProjectionParams.y));
                float4 aspect = abs(nearUpperRight.y / nearUpperRight.x);
                expandDir.x *= aspect;
                o.vertex.xy += expandDir * (_OutLineHold * 0.01 * o.vertex.w) ;
                
                return o;
            }
            fixed4 drawOutLine(v2f i) : SV_Target
            {
                return _OutLineColor;
            }

        ENDCG
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            ENDCG
        }
        Pass
        {
            Cull Front
            CGPROGRAM
            #pragma vertex drawOutLineVert
            #pragma fragment drawOutLine
            ENDCG
        }
    }
}
