# Linux Tools

## General
* dstat - 可以取代vmstat，iostat，netstat和ifstat这些命令的多功能产品
* All hardwares' info: `sudo dmidecode`

## CPU
* Show available cpu cores for current thread: `nproc --all`
* Display information about the CPU architecture: `lscpu`
* Show detailed core info: `cat /proc/cpuinfo`
* Show CPU Manufacturer:: `sudo dmidecode --type processor`

## Memory
* `free`
* `cat /proc/meminfo`
* `pmap <pid>`
* `vmstat`

## Storage

* The Virtual Memory Toucher: `vmtouch`
* Show disk instances: `fdisk -lu`
* Show UUID: `blkid`, SSD: 1--hdd, 0--ssd
* List block devices: `lsblk -d -o name,rota`
* Check if the device is of rotational type or non-rotational type: `cat /sys/block/sda/queue/rotational`

### write disk image
* dd if=/dev/zero of=test2 bs=1G count=10 oflag=dsync
* fio randomrw.fio
```
[global]
name=fiotest
ioengine=libaio
direct=1
iodepth=32
group_reporting
runtime=60
startdelay=60

[random-rw-test1]
rw=randread
bs=4k
size=1Gb
numjobs=8
filename=/home/admin/xiaming.cxm/testvrbd/test1

[random-rw-test2]
rw=randwrite
bs=4k
size=1Gb
numjobs=8
filename=/home/admin/xiaming.cxm/testvrbd/test2
```

## Network
* 网络配置相关：ifconfig、ip
* 路由相关：route、netstat、ip
* 查看端口工具：netstat、lsof、ss、nc、telnet
* 下载工具：curl、wget、axel
* 防火墙：iptables、ipset
* 流量相关：iftop、nethogs
* 连通性及响应速度：ping、traceroute、mtr、tracepath
* 域名相关：nslookup、dig、whois
* web服务器：python、nginx
* 抓包相关：tcpdump
* 网桥相关：ip、brctl、ifconfig、ovs
* Check port opened: `netstat -taupen | grep 443`

## PCIe

## GPU
