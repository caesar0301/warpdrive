### Ubuntu
```bash
# Install dependencies
sudo apt install shadowsocks-libev
sudo systemctl stop shadowsocks-libev
sudo systemctl disable shadowsocks-libev  # Dsiable ss server

# Configure ss local
sudo touch /etc/shadowsocks-libev/local.json
sudo vim /etc/shadowsocks-libev/local.json
{
 "server":"xxxx",
 "server_port":xxxx,
 "local_address":"127.0.0.1",
 "local_port":1080,
 "password":"xxxx",
 "timeout":60,
 "method":"chacha20-ietf-poly1305"
}

sudo systemctl enable shadowsocks-libev-local@local.service
sudo systemctl restart shadowsocks-libev-local@local.service
sudo systemctl status shadowsocks-libev-local@local.service
```

Install proxychains for terminal:
```bash
sudo apt install proxychains
sudo vim /etc/proxychains.conf
socks5   127.0.0.1   1080
quiet_mode

sudo vim /usr/lib/proxyresolv
DNS_SERVER=8.8.8.8
```
Install polipo for http/https proxy
```bash
sudo apt install polipo
sudo vim /etc/polipo/config  # Http proxy for terminal, default port 8123
socksParentProxy = "localhost:1080"
socksProxyType = socks5
```

### CentOS 7

```bash
cd /etc/yum.repos.d/
curl -O https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
yum install -y shadowsocks-libev

# Edit /etc/shadowsocks-libev/local.json
firewall-cmd --permanent --add-port=44290/tcp
firewall-cmd --permanent --add-port=44290/udp
firewall-cmd --reload

yum install firewalld
systemctl start firewalld
systemctl enable firewalld
systemctl status firewalld

systemctl start shadowsocks-libev
systemctl enable shadowsocks-libev
journalctl -u shadowsocks-libev

# Install proxychains
wget -O- https://gist.githubusercontent.com/ifduyue/dea03b4e139c5758ca114770027cf65c/raw/install-proxychains-ng.sh | sudo bash -s

version=4.13
wget https://github.com/rofl0r/proxychains-ng/archive/v$version.tar.gz
tar xf v$version.tar.gz
(cd proxychains-ng-$version
 ./configure
 make
 make install
 [[ -f /etc/proxychains.conf ]] || cp src/proxychains.conf /etc/proxychains.conf
)
rm -rf v$version.tar.gz proxychains-ng-$version
```

### Debian
* https://github.com/shadowsocks/shadowsocks-libev#install-from-repository


### HTTP proxy
Proxy list for .bashrc
```bash
alias proxy='export OLD_PROMPT="$PROMPT";export http_proxy=http://127.0.0.1:8123;export https_proxy=http://127.0.0.1:8123;export PROMPT="[PROXY] $PROMPT"'
alias unproxy='export PROMPT=$OLD_PROMPT;unset http_proxy;unset https_proxy;unset OLD_PROMPT'
```

### Refrences
* https://portal.shadowsocks.nu/clientarea.php?action=productdetails&id=1026915
* https://www.linuxbabe.com/ubuntu/shadowsocks-libev-proxy-server-ubuntu-16-04-17-10
* https://www.linuxbabe.com/desktop-linux/how-to-use-proxychains-to-redirect-your-traffic-through-proxy-server
* ss-local.sh: https://www.zfl9.com/ss-local.html
