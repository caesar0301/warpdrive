字符串判断	 
[ stringA=stringB ]	stringA等于stringB
[ stringA==stringB ]	stringA等于stringB
[ stringA!=stringB ]	stringA不等于stringB
[ string ]	string不为空
[ -z string ]	string长度为0
[ -n string ]	string长度不为0

逻辑判断	 
[ stringA -a stringB ]	stringA和stringB都是真
[ stringA -o stringB ]	stringA或stringB是真
[ !string ]	string不为真

逻辑判断(复合判断)	 
[[ pattern1 && pattern2 ]]	pattern1和pattern2都是真
[[ pattern1 || pattern2 ]	pattern1或pattern2是真
[[ !pattern ]]
[[ stringA =~ pattern ]]
pattern不为真
stringA匹配pattern

整数判断	 
[ intA -eq intB ]	intA等于intB
[ intA -ne intB ]	intA不等于intB
[ intA -gt intB ]	intA大于intB
[ intA -ge intB ]	intA大于等于intB
[ intA -lt intB ]	intA小于intB
[ intA -le intB ]	intA小于等于intB

文件判断中的二进制操作	 
[ fileA -nt fileB ]	fileA比fileB新
[ fileA -ot fileB ]	fileA比fileB旧
[ fileA -ef fileB ]	fileA和fileB有相同的设备或者inode值

文件检验	 
[ -d $file ] or [[ -d $file ]]	file为目录且存在时为真
[ -e $file ] or [[ -e $file ]]	file为文件且存在时为真
[ -f $file ] or [[ -f $file ]]	file为非目录普通文件存在时为真
[ -s $file ] or [[ -s $file ]]	file文件存在, 且长度不为0时为真
[ -L $file ] or [[ -L $file ]]	file为链接符且存在时为真
[ -r $file ] or [[ -r $file ]]	file文件存在且可读时为真
[ -w $file ] or [[ -w $file ]]	file文件存在且可写时为真
[ -x $file ] or [[ -x $file ]]	file文件存在且可执行时为真

[[ $a == z* ]]   # True if $a starts with an "z" (pattern matching).
[[ $a == "z*" ]] # True if $a is equal to z* (literal matching).
[ $a == z* ]     # File globbing and word splitting take place.
[ "$a" == "z*" ] # True if $a is equal to z* (literal matching).
