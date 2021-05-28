Shader "Unlit/ViewPortOutline"
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

            v2f drawLineNormalVert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.realViewDir = (fixed3)normalize(_WorldSpaceCameraPos.xyz - o.worldPos.xyz);
                return o;
            }
            fixed4 drawOutLineNormalFrag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                fixed3 worldNormal = normalize(i.worldNormal);
                fixed outLineValue = max(0, dot(i.realViewDir, worldNormal));
                fixed4 finColor = col;
                //不要这样写，if-else语句会打断GPU并行流程
                // if (outLineValue < _OutLineHold)
                // {
                //     finColor = _OutLineColor;
                // }
                // else
                // {
                //     finColor = col;
                // }
                fixed isEdge = step(outLineValue, _OutLineHold);
                fixed4 edgeColor = _OutLineColor * isEdge;
                finColor = (1 - isEdge) * finColor + edgeColor;
                return finColor;
            }
        ENDCG
        
        Pass
        {
            CGPROGRAM
            #pragma vertex drawLineNormalVert
            #pragma fragment drawOutLineNormalFrag
            ENDCG
        }
    }
}
