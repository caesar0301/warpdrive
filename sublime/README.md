Chinese Input in Sublime Text
==============================

仅测试Ubuntu 16.04 LTS，其他平台类似

Compile
----

`gcc -shared -o libsublime-imfix.so sublime_imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC`


Install
-------

`sudo cp libsublime-imfix.so /opt/sublime_text`


Config
-------

`$vim /usr/bin/subl`

LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text "$@"

