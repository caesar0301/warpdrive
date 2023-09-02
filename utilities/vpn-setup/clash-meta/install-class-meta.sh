#!/bin/bash
THISFILE=$(cd ${0%/*} && echo $PWD/${0##*/})
THISPATH=$(dirname $THISFILE)

VERSION="v1.15.1"
RELEASE="https://github.com/MetaCubeX/Clash.Meta/releases/download/$VERSION/clash.meta-linux-amd64-$VERSION.gz"

LOCALCOPY=/tmp/clash.meta-linux-amd64-$VERSION.gz
if [ ! -e $LOCALCOPY ]; then
    wget $RELEASE -O $LOCALCOPY
fi

gzip -k -f -d $LOCALCOPY
chmod +x /tmp/clash.meta-linux-amd64-$VERSION
sudo mv /tmp/clash.meta-linux-amd64-$VERSION /usr/local/bin/Clash-Meta
sudo chown root:root /usr/local/bin/Clash-Meta

if [ ! -e /etc/Clash-Meta ]; then
    sudo mkdir /etc/Clash-Meta
fi
sudo cp $THISPATH/Clash-Meta.service /etc/systemd/system/Clash-Meta.service
sudo systemctl daemon-reload

sudo useradd -m clash-meta
sudo groupadd clash-meta
sudo usermod -a -G clash-meta clash-meta

sudo touch /etc/Clash-Meta/cache.db
sudo chmod 777 /etc/Clash-Meta/cache.db

if [ $(getenforce) != "Disabled" ]; then
    echo "SELinux should be disabled, exit" && exit 0
fi

sudo systemctl enable Clash-Meta
sudo systemctl start Clash-Meta
sudo systemctl status Clash-Meta
