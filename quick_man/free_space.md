# FREE SPACE

## systemd journal log

journalctl --verify

### Retain only the past two days:
sudo journalctl --vacuum-time=5d

### Retain only the past 500 MB:
journalctl --vacuum-size=500M
