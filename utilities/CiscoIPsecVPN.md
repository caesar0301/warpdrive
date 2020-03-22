## 安装vpnc客户端CentOS或者Redhat：
yum intall -y vpnc

## Ubuntu或者Debian:
apt-get install vpnc修改配置文件

## 使用管理员权限修改默认配置/etc/vpnc/default.conf
IPSec gateway jackfan.com
IPSec ID OmniLab
IPSec secret 304
Xauth username YOUR_VPN_USERNAME
Xauth password YOUR_PASSWORD

## 连接 Cisco VPN
sudo vpnc

## 断开 Cisco VPN
sudo vpnc-disconnect