### Install on Ubuntu
Install dependencies:
```bash
sudo apt install shadowsocks-libev
sudo systemctl stop shadowsocks-libev
sudo systemctl disable shadowsocks-libev
sudo touch /etc/shadowsocks-libev/local.json
sudo vim /etc/shadowsocks-libev/local.json

sudo systemctl start shadowsocks-libev-local@local.service
sudo systemctl enable shadowsocks-libev-local@local.service
sudo systemctl status shadowsocks-libev-local@local.service
```

For `/etc/shadowsocks-libev/local.json`:
```json
{
 "server":"hk3-sta74.txrh9.pw",
 "server_port":44290,
 "local_address":"127.0.0.1",
 "local_port":1080,
 "password":"HTTbfbXmTEc4dF9",
 "timeout":60,
 "method":"chacha20-ietf-poly1305"
}
```

Install proxychains for terminal:
```bash
sudo apt install proxychains
sudo vim /etc/proxychains.conf
sudo vim /usr/lib/proxyresolv
```
```bash
# /etc/proxychains.conf
socks5   127.0.0.1   1080
quiet_mode
```

```bash
# /usr/lib/proxyresolv
DNS_SERVER=8.8.8.8
```

Http proxy for terminal
```bash
sudo apt install polipo
sudo vim /etc/polipo/config
```
```bash
socksParentProxy = "localhost:1080"
socksProxyType = socks5
```

### HTTP proxy
Proxy list
```bash
alias proxy='export OLD_PROMPT="$PROMPT";export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;export PROMPT="[PROXY] $PROMPT"'
alias unproxy='export PROMPT=$OLD_PROMPT;unset http_proxy;unset https_proxy;unset OLD_PROMPT'
```

### Refrences
* https://portal.shadowsocks.nu/clientarea.php?action=productdetails&id=1026915
* https://www.linuxbabe.com/ubuntu/shadowsocks-libev-proxy-server-ubuntu-16-04-17-10
* https://www.linuxbabe.com/desktop-linux/how-to-use-proxychains-to-redirect-your-traffic-through-proxy-server
