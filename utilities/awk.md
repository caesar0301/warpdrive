## awk的常规表达式元字符

\ 换码序列
^ 在字符串的开头开始匹配
$ 在字符串的结尾开始匹配
. 与任何单个字符串匹配
[ABC] 与[]内的任一字符匹配
[A-Ca-c] 与A-C及a-c范围内的字符匹配（按字母表顺序）
[^ABC] 与除[]内的所有字符以外的任一字符匹配
Desk|Chair 与Desk和Chair中的任一个匹配
[ABC][DEF] 关联。与A、B、C中的任一字符匹配，且其后要跟D、E、F中的任一个字符。
\* 与A、B或C中任一个出现0次或多次的字符相匹配 
\+ 与A、B或C中任何一个出现1次或多次的字符相匹配
？ 与一个空串或A、B或C在任何一个字符相匹配
（Blue|Black）berry 合并常规表达式，与Blueberry或Blackberry相匹配 

## awk算术运算符

运算符 用途
------------------
x^y x的y次幂
x**y 同上
x%y 计算x/y的余数（求模）
x+y x加y
x-y x减y
x*y x乘y
x/y x除y
-y 负y(y的开关符号);也称一目减
++y y加1后使用y(前置加）
y++ 使用y值后加1（后缀加）
--y y减1后使用y(前置减）
y-- 使用后y减1(后缀减）
x=y 将y的值赋给x
x+=y 将x+y的值赋给x
x-=y 将x-y的值赋给x
x*=y 将x*y的值赋给x
x/=y 将x/y的值赋给x x%=y 将x%y的值赋给x
x^=y 将x^y的值赋给x
x**=y 将x**y的值赋给x

## awk允许的测试：
操作符 含义
x==y x等于y
x!=y x不等于y
x>y x大于y
x>=y x大于或等于y
x<y x小于y
x<=y x小于或等于y?
x~re x匹配正则表达式re?
x!~re x不匹配正则表达式re? 

## awk的操作符(按优先级升序排列)
= 、+=、 -=、 *= 、/= 、 %=
||
&&
\> >= < <= == != ~ !~
xy (字符串连结，'x''y'变成"xy"）
\+ -
\* / % 
++ --

## awk内置变量（预定义变量）

说明：表中v项表示第一个支持变量的工具（下同）：A=awk，N=nawk,P=POSIX awk,G=gawk

V 变量 含义 缺省值
--------------------------------------------------------
N ARGC 命令行参数个数 
G ARGIND 当前被处理文件的ARGV标志符
N ARGV 命令行参数数组
G CONVFMT 数字转换格式 %.6g
P ENVIRON UNIX环境变量
N ERRNO UNIX系统错误消息
G FIELDWIDTHS 输入字段宽度的空白分隔字符串
A FILENAME 当前输入文件的名字
P FNR 当前记录数
A FS 输入字段分隔符 空格
G IGNORECASE 控制大小写敏感0（大小写敏感）
A NF 当前记录中的字段个数
A NR 已经读出的记录数
A OFMT 数字的输出格式 %.6g
A OFS 输出字段分隔符 空格
A ORS 输出的记录分隔符 新行
A RS 输入的记录他隔符 新行
N RSTART 被匹配函数匹配的字符串首
N RLENGTH 被匹配函数匹配的字符串长度
N SUBSEP 下标分隔符 "\034"

## awk的内置函数

V 函数 用途或返回值
------------------------------------------------
N gsub(reg,string,target) 每次常规表达式reg匹配时替换target中的string
N index(search,string) 返回string中search串的位置
A length(string) 求串string中的字符个数
N match(string,reg) 返回常规表达式reg匹配的string中的位置
N printf(format,variable) 格式化输出，按format提供的格式输出变量variable。
N split(string,store,delim) 根据分界符delim,分解string为store的数组元素
N sprintf(format,variable) 返回一个包含基于format的格式化数据，variables是要放到串中的数据
G strftime(format,timestamp) 返回一个基于format的日期或者时间串，timestmp是systime()函数返回的时间
N sub(reg,string,target) 第一次当常规表达式reg匹配，替换target串中的字符串
A substr(string,position,len) 返回一个以position开始len个字符的子串
P totower(string) 返回string中对应的小写字符
P toupper(string) 返回string中对应的大写字符
A atan(x,y) x的余切(弧度)
N cos(x) x的余弦(弧度)
A exp(x) e的x幂
A int(x) x的整数部分
A log(x) x的自然对数值
N rand() 0-1之间的随机数
N sin(x) x的正弦(弧度)
A sqrt(x) x的平方根
A srand(x) 初始化随机数发生器。如果忽略x，则使用system()
G system() 返回自1970年1月1日以来经过的时间（按秒计算）