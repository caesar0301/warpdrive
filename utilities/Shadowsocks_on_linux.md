## Install Shadowsocks and configure client

### Ubuntu
* Install dependencies
```bash
sudo apt install shadowsocks-libev
sudo systemctl stop shadowsocks-libev
sudo systemctl disable shadowsocks-libev  # Disable ss server
```
* Configure ss client
```bash
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
```

### Debian
* Install SS package: https://github.com/shadowsocks/shadowsocks-libev#install-from-repository
* Configure SS client similar to Ubuntu above

### CentOS 7
* Install dependencies
```bash
cd /etc/yum.repos.d/
curl -O https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
yum install -y shadowsocks-libev
systemctl start shadowsocks-libev
systemctl enable shadowsocks-libev
journalctl -u shadowsocks-libev
```
* Configure ss client
```bash
vi /etc/shadowsocks-libev/local.json
```

### MX Linux
* Install ss package (Debian): https://github.com/shadowsocks/shadowsocks-libev#install-from-repository
* Stop ss server `sudo /etc/init.d/shadowsocks-libev stop`
* Disable ss server on startup `sudo update-rc.d shadowsocks-libev disable` or `sudo sysv-rc-conf`
* Edit `/etc/shadowsocks-libev/local.json` for local configuration as above
* Test local configuration: `ss-local -c /etc/shadowsocks-libev/local.json`
* Install python client `pip install git+https://github.com/shadowsocks/shadowsocks.git@master`
* Test python client `sslocal -c /etc/shadowsocks-libev/local.json -d start`
* Auto start via `/etc/init.d/sslocal`: https://gist.github.com/caesar0301/d200ba2b8f5334b414911ecb24eb0923

Enable autostart
```bash
sudo chmod +x /etc/init.d/sslocal
sudo update-rc.d sslocal defaults 90
```
Disable autostart
```bash
sudo update-rc.d -f sslocal remove
```

## Install terminal and HTTP proxies

### Ubuntu/Debian/MXLinux
* Install proxychains for terminal:
```bash
sudo apt install proxychains
sudo vim /etc/proxychains.conf
socks5   127.0.0.1   1080
quiet_mode
```
* Install polipo for http/https proxy
```bash
sudo apt install polipo
sudo vim /etc/polipo/config  # Http proxy for terminal, default port 8123
socksParentProxy = "localhost:1080"
socksProxyType = socks5
```

### CentOS
```bash
# Install proxychains
wget -O- https://gist.githubusercontent.com/ifduyue/dea03b4e139c5758ca114770027cf65c/raw/install-proxychains-ng.sh | sudo bash -s
sudo vim /etc/proxychains.conf
sudo vim /usr/lib/proxyresolv
```

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
* ss-installmd: https://gist.github.com/aa65535/ea090063496b0d3a1748
