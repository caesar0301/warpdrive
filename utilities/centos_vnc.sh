# Install GNOME Desktop

yum group list
yum groupinstall "GNOME Desktop" "Graphical Administration Tools"
# Enable GUI on system startup
ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
reboot

# Install VNC Server

yum install -y tigervnc-server xorg-x11-fonts-Type1
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
# Modify <USER>
vi /etc/systemd/system/vncserver@:1.service

firewall-cmd --permanent --add-port=5901/tcp
firewall-cmd --reload

vncserver :1 -geometry 1920x1080 -depth 32

systemctl daemon-reload
systemctl start vncserver@:1.service
systemctl enable vncserver@:1.service
systemctl status vncserver@:1.service

# Install RDP Server (Alternative)

yum -y install xrdp tigervnc-server
systemctl start xrdp

netstat -antup | grep xrdp
systemctl enable xrdp

firewall-cmd --permanent --add-port=3389/tcp
firewall-cmd --reload

chcon --type=bin_t /usr/sbin/xrdp
chcon --type=bin_t /usr/sbin/xrdp-sesman
