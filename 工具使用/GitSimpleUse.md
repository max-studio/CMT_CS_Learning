# Git

[author]：HCJ

[git官网] https://git-scm.com/

[国内镜像]http://npm.taobao.org/mirrors/git-for-windows/

[廖雪峰GIT学习文档]https://www.liaoxuefeng.com/wiki/896043488029600

**Git** 版本控制（Revision control）：一种在开发的过程中用于管理我们对文件、目录或工程等内容的修改历史，方便查看更改历史记录，备份以便恢复以前的版本的软件工程技术。



**现在常见版本控制工具**

**Git **（分布式版本控制） 每个人都有一份完整代码，可以在本地进行推送

**SVN**（Subversion）（集中式版本控制）只有中央服务器拥有完整代码与版本 开发者只能更新和上传当前版本的代码

**CVS**（Concurrent Versions System）

**VSS**（Micorosoft Visual SourceSafe）

**TFS**（Team Foundation Server）



**基本使用**：

**Git Bash：**Unix与Linux风格的命令行

**Git CMD：**Windows风格的命令行

**Git GUI**：Git的图形界面



**常见命令（linux命令行）**

~~~
cd : 改变目录。
cd . . 回退到上一个目录，直接cd进入默认目录
pwd : 显示当前所在的目录路径。
ls(ll):  都是列出当前目录中的所有文件，ls(ll)列出的内容更为详细。
touch : 新建一个文件 如 touch XXX 就会在当前目录下新建一个XXX文件。
rm:  删除一个文件, rm XXX 就会把XXX文件删除。
mkdir:  新建一个目录,就是新建一个文件夹。
rm -r :  删除一个文件夹, rm -r XXX 表示删除XXX目录
rm -rf / 清除全部文件
mv 移动文件, mv +（被移动文件）+（目标文件夹） 必须保证文件和目标文件夹在同一目录。
reset 重新初始化终端/清屏。
clear 清屏。
history 查看命令历史。
help 帮助。
exit 退出。
#表示注释
~~~

**Git配置文件**

~~~
git config -l #查看配置
git config --system --list #查看系统config
git config --global --list #查看当前用户（global）配置
git remote -v  #查看远程仓库
~~~

**配置用户名与邮箱**

~~~
git config -l #查看配置
git config --system --list #查看系统config
git config --global --list #查看当前用户（global）配置
git remote -v  #查看远程仓库
~~~

**初始化本地仓库并克隆远程仓库**

~~~
git init #初始化仓库
git remote add origin 粘贴复制的SSH地址  #建立远程连接
git clone 粘贴复制的SSH地址              #克隆远程仓库
~~~

**本地文件同步至远程仓库基本操作**

~~~
cd hello-gitee              #定位到 hello-gitee 文件夹
touch 记录.doc               #新建一个记录.doc文件
git add 记录.doc             #新增“记录.doc”至暂存区
git commit -m "新纪录"       #确认新增“记录.doc”至数据目录
git push -u origin master   #推送新增文件到远程仓库
~~~

**GIT Vim文本编辑器的使用:**

~~~
vi 文件名 #编辑文件
vim 文件名 #编辑文件
cat 文件名 #预览文件内容

进入界面后输入i进入插入模式

末行模式下：
   先按esc退出编辑 然后按住Shift+; 
输入:
    q 直接退出
    wq 保存并退出
    q! 不保存退出，强行退出
    w 保存
    w! 强行保存

编辑模式下：
或者按住Shift再连续按两次z 可以执行保存退出操作
~~~

Vim使用教程：https://blog.csdn.net/y1412813204/article/details/83012886

GIt下Vim使用教程：https://blog.csdn.net/bertZuo/article/details/89015718

**版本控制**

~~~
git log #查看历史记录
git log --pretty=oneline #查看简洁版历史记录

HEAD表示当前版本

版本回退：
git reset --hard HEAD^  #上一个版本
git reset --hard 该版本的commitID（不用写全，git会自动查找） #回退到指定版本

如果回退以后还需要回到现在的版本则需要保存commitID

git checkout -- <file> #撤销xx文件在工作区的修改
git reset HEAD <file> #撤销xx文件在暂存区的修改

rm <file> #删除文件
git rm <file> 
git commit -m "xxx" #从版本库中删除文件
~~~

**分支管理**

~~~
git branch 分支名 #创建分支
git checkout 分支名 #切换到指定分支
git checkout -b 分支名 #创建并切换到分支
git branch #列出所有分支
git merge 分支名 #将指定分支合并到当前分支
git branch -d 分支名 #删除指定分支

新版本 切换分支
git switch #切换到指定分支
git switch -c 分支名 #创建并切换到指定分支

git log --graph #查看分支合并图

git merge --no-ff -m "信息" 分支名 #合并分支 并禁用fast forward

删除远程分支
git push origin --delete 分支名
~~~

**多人协同开发**

~~~
git remote #查看远程仓库
git remote -v #查看远程仓库详细信息

git push origin master #将所有的本地提交推送到远程库
git push origin 分支名 #其他仓库推送

一般情况下：
* master分支是主分支，因此要时刻与远程同步；
* dev分支是开发分支，团队所有成员都需要在上面工作，所以也需要与远程同步；
* bug分支只用于在本地修复bug，就没必要推到远程；
* feature分支是否推到远程，取决于你是否和你的小伙伴合作在上面开发。
~~~

**特殊命令**

~~~
git rm -r --cached . 清除缓存
~~~

**Git的三个工作区域**

工作目录（Working Directory）、暂存区(Stage/Index)、资源库(Repository或Git Directory)



![img](en-resource://database/1085:0)

~~~
	* Workspace：工作区，用于存放自己编写的代码
	* Index / Stage：暂存区，用于存放代码改动部分
	* Repository：仓库区，一个本地仓库，本地提交的所有版本都会存在这里
	* Remote：远程仓库，服务器上的远程仓库，存有所有版本的代码
~~~

**git文件操作**

***modified*** 自己修改过的代码

***staged*** 已存暂存区的代码

***committed*** 已提交到远程仓库的代码

***Untracked*** 未跟踪, 此文件在文件夹中, 但并没有加入到git库, 不参与版本控制.通过git add 状态变为Staged

***Unmodify*** 文件已经入库, 未修改, 即版本库中的文件快照内容与文件夹中完全一致. 这种类型的文件有两种去处, 如果它被修改, 而变为Modified. 如果使用git rm移出版本库, 则成为Untracked文件



**.gitignore 用于配置需要忽略的文件**

忽略文件中的空行或以井号（#）开始的行将会被忽略。可以使用Linux通配符。

例如：

星号（*）代表任意多个字符，问号（？）代表一个字符，方括号（[abc]）代表可选字符范围，大括号（{string1,string2,...}）代表可选的字符串等。

如果名称的最前面有一个感叹号（!），表示例外规则，将不被忽略。

如果名称的最前面是一个路径分隔符（/），表示要忽略的文件在此目录下，而子目录中的文件不忽略。

如果名称的最后面是一个路径分隔符（/），表示要忽略的是此目录下该名称的子目录，而非文件（默认文件或目录都忽略）。

~~~
#为注释
*.txt
#忽略所有 .txt结尾的文件,这样的话上传就不会被选中！
!lib.txt     
#但lib.txt除外
/temp        
#仅忽略项目根目录下的TODO文件,不包括其它目录temp
build/       
#忽略build/目录下的所有文件
doc/*.txt    
#会忽略 doc/notes.txt 但不包括 doc/server/arch.txt
~~~

