## ELF文件工具
```
// show all headers
readelf -h a.so
objdump -x a.so        

// show symbols
readelf -Ws  a.so | c++filt 
objdump -CTt a.so 
nm -Au  a.so     // undefined symbols

// show dynamic section
readelf -d a.so

// show ctors or dtors
readelf -S a.out
objdump -dr -j .ctors a.out
objdump -dr -j .init_array a.out
```
