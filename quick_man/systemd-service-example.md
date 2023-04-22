## For example trojan.service

```
[Unit]
Description=Trojan SS service
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=chenxm
ExecStart=/home/chenxm/bin/trojan/trojan -c /home/chenxm/bin/trojan/config.json

[Install]
WantedBy=multi-user.target
```

#### Install
```
sudo cp trojan.service /etc/systemd/system/
sudo systemctl enable trojan.service
sudo systemctl start trojan.service
```