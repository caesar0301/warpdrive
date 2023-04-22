# Install OS

```
sudo apt install rpi-imager
```

NOTE: Use advanced menu to configure headless install:
* ssh
* Wireless network (if available)

## Init wired network 

In case no wireless metwork, configure eth before first boot:
```
cd /media/sd/rootfs/etc
vim dhcpcd.conf
```

```txt
interface eth0
static ip_address=192.168.1.120
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```
