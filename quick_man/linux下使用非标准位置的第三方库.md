运行时使用非标准位置/usr/lib和/lib下的库的方式有三种： 
方法一：在配置文件/etc/ld.so.conf中指定动态库搜索路径。 
vi /etc/ld.so.conf 
添加 lib目录 
ldconfig 
方法二：通过环境变量LD_LIBRARY_PATH指定动态库搜索路径。 
export LD_LIBRARY_PATH=”LD_LIBRARY_PATH:/opt/” 
方法三：在编译目标代码时指定该程序的动态库搜索路径。 
还可以在编译目标代码时指定程序的动态库搜索路径。通过gcc 的参数”-Wl,-rpath,”指定

共享库搜索顺序一般是$LDLIBRARY_PATH，/etc/ld.so.cache, /usr/lib, /lib

========
另外，顺便温习了一下其它和库相关的基础知识：

库的目的是代码重用，提供共用的功能，某个程序为别的程序提供公开的接口等。

命名和编号： 
(1) 所有库名以lib开头，gcc在-l指定的文件名前自动插入lib，如libmysqlclient就用-lmysqlclient
(2) .a是静态库(archive)，如 libmysqlclient.a
(3) .so是共享库(shared object)，如libmysqlclient.so
(4) 编号格式：library_name.major_num.minor_num.patch_num，如libmysqlclient.so.15.0.0
(5) _g和_p: /usr/lib/libform_g.a 中的_g表示这是libform.a的调试库，用locate _g.a会发现很多类似的库，但我用locate _g.so没有发现FC4有此类库；libxxx_p.a中的_p表示这是libxxx.a的性能分析库（profiling），但我用locate _p.a和locate _p.so没有发现FC4有此类路库。

库要和接口头文件配合使用，常见的库如：
libc.so (不需头文件) 标准C库
libdl.so (dlfcn.h) 让程序在运行是加载和使用库代码，而不在编译时链接库
libglib.so (glib.h) Glib工具函数，例如hash, string等
libgthread.so (glib.h) 对Glib的线程支持
libm.so (math.h) 标准C数学库
libpthread.so (pthread.h) POSIX标准Linux线程库
libz.so (zlib.h) 通用压缩程序库

库操作命令：
(1) nm 列出目标文件或二进制文件的所有符号
(2) ar 创建静态库和符号索引
(3) ldd 列出程序正常运行所需要的共享库，例如
# ldd test_mysql
linux-gate.so.1 => (0x00c59000)
libmysqlclient.so.15 => /lib/libmysqlclient.so.15 (0x009a1000)
libc.so.6 => /lib/libc.so.6 (0x0038b000)
libpthread.so.0 => /lib/libpthread.so.0 (0x004f8000)
libcrypt.so.1 => /lib/libcrypt.so.1 (0x002f0000)
libnsl.so.1 => /lib/libnsl.so.1 (0x00320000)
libm.so.6 => /lib/libm.so.6 (0x004bd000)
/lib/ld-linux.so.2 (0x0036d000)
(4) ldconfig 和动态链接和装载工具ld.so/ld-linux.so一起决定位于/usr/lib和/lib下的so库所需的链接。ldconfig创建一个从实际 库到so库名的符号链接。注意/etc/ld.so.cache, /etc/ld.so.conf ldconfig -p列出/etc/ld.so.cache内的库对照链接。

环境变量：
动态链接器ld.so/ld-linux.so使用一些环境变量：
$LDLIBRARY_PATH : 格式类似$PATH，:分隔，非标准位置/usr/lib和/lib下的库或者/etc/ld.so.cache中没有的库，需要加入该变量才能被搜索到。
$LD_PRELOAD: 空格分隔，定义需要在最前面加载的库。也可以由/etc/ld.so.preload文件代替

静态库和共享库都是包含object文件的文件。

建立和使用静态库：
（1） 把代码编译成目标文件，如gcc -c libxxx.c -o libxxx.o
（2） ar: ar -rcs linxxx.a linxxx.o
（3） gcc -static: gcc test.c -o test -static -L. -lxxx
（4） 用file检查静态链接的可执行文件
（5） 用nm检查符号，静态链接没有未定义符号

共享库占用系统资源少（磁盘和内存），运行时根据共享链接从单个文件加载，速度快，维护方便。在运行时，ld.so/ld-linux.so把二进制文件中的符号名链接到适当的so库上。

建立和使用共享库：
(1) gcc -fPIC 产生与位置无关的代码，如gcc -fPIC -g -c libxxx.c -o libxxx.o
(2) gcc -shared和-soname，如gcc -g -shared -Wl,–soname, -libxxx.so -o libxxx.so.1.0.0 libxxx.o (注意-Wl,–soname, -libxxx.so 中间没有空格)
(3) gcc -Wl 把参数传递给链接器ld
(4) gcc -l显式链接C库

编译时指定非标准位置/usr/lib和/lib下的库的方式是用-L库目录指定。