# Shadowsocks

## Install Shadowsocks

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
* Install shadowsocks-libev: https://github.com/shadowsocks/shadowsocks-libev#install-from-repository
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


## Shadowsocks in Terminal

### Ubuntu/Debian/MXLinux

* `proxychains`:
```bash
sudo apt install proxychains
sudo vim /etc/proxychains.conf
socks5   127.0.0.1   1080
quiet_mode
```

### CentOS
* `proxychains`:
```bash
wget -O- https://gist.githubusercontent.com/ifduyue/dea03b4e139c5758ca114770027cf65c/raw/install-proxychains-ng.sh | sudo bash -s
sudo vim /etc/proxychains.conf
sudo vim /usr/lib/proxyresolv
```


## Shadowsocks on HTTP

### goproxy
1. Download binary: https://github.com/snail007/goproxy/releases
2. Configure: `/etc/systemd/system/socks2http.service`
```
[Unit]
Description=socks2http
After=network.target

[Service]
ExecStart=/usr/local/bin/proxy sps -S socks -T tcp -P 127.0.0.1:1080 -t tcp -p :1081
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartPreventExitStatus=255
Type=simple

[Install]
WantedBy=multi-user.target
```

### polipo (Global)
```bash
sudo apt install polipo
sudo vim /etc/polipo/config  # Http proxy for terminal, default port 8123
socksParentProxy = "localhost:1080"
socksProxyType = socks5
```

### privoxy (Global & Auto)
```bash
sudo apt install privoxy
# Ref: https://juejin.im/post/5c91ff5ee51d4534446edb9a
```

### Shortcuts
To `.bashrc`
```bash
alias proxy='export OLD_PROMPT="$PROMPT";export http_proxy=http://127.0.0.1:1081;export https_proxy=http://127.0.0.1:1081;exprt PROMPT="[PROXY] $PROMPT"'
alias unproxy='export PROMPT=$OLD_PROMPT;unset http_proxy;unset https_proxy;unset OLD_PROMPT'
```


## Gfwlist
```bash
sudo pip install genpac
genpac -p "SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" --gfwlist-url=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt --output="autoproxy.pac"
```


## Refrences
* https://portal.shadowsocks.nu/clientarea.php?action=productdetails&id=1026915
* https://www.linuxbabe.com/ubuntu/shadowsocks-libev-proxy-server-ubuntu-16-04-17-10
* https://www.linuxbabe.com/desktop-linux/how-to-use-proxychains-to-redirect-your-traffic-through-proxy-server
* ss-local.sh: https://www.zfl9.com/ss-local.html
* ss-installmd: https://gist.github.com/aa65535/ea090063496b0d3a1748
