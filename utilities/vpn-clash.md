# Clash

1. Download clash from https://github.com/Dreamacro/clash/releases

2. gzip -d clash-xxx.gz

3. Download subscript hosts to ~/.config/clash

* wget -O config.yaml subscription_url
* wget -O Country.mmdb https://www.sub-speeder.com/client-download/Country.mmdb

4. Add /etc/systemd/system/clash.service
```
[Unit]
Description=Clash Service
After=network.target

[Service]
User=chenxm
Group=chenxm
UMask=0644
ExecStart=/opt/clash/clash-linux-armv7-v1.11.8
ExecStop=/bin/kill $MAINPID

[Install]
WantedBy=multi-user.target
```

5. Enable clash by default
```
sudo systemctl daemon-reload
sudo systemctl enable clash
```

6. Dashboard
* http://clash.razord.top/#/proxies
