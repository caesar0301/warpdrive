在Ubuntu中加入LVM2的支持
1. 安装lvm2
sudo apt-get install lvm2
2. 扫描 LVM 找到 VG
$ sudo vgscan
Reading all physical volumes. This may take a while…
Found volume group “VolGroup01″ using metadata type lvm2
3. 激活 VG
$ sudo vgchange -ay VolGroup01
2 logical volume(s) in volume group “VolGroup01″ now active
4. 测试，列出 LV
$ sudo lvs
LV VG Attr LSize Origin Snap% Move Log Copy% Convert
LogVol00 VolGroup01 -wi-a- 6.88g
LogVol01 VolGroup01 -wi-a- 1.00g
5. mount
$ sudo mount /dev/VolGroup01/LogVol00 /mnt
这条命令是将设备/dev/VolGroup01/LogVol00挂载到/mnt目录下
我们可以修改这个目录，比如我就是挂在到/mnt/vol目录下的
挂载后,打开/mnt/vol目录，就进入了设备/dev/VolGroup01/LogVol00的根目录
6. 轻松愉快的读取CentOS分区上的内