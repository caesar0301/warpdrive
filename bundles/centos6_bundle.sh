#!/bin/bash
# set -e

TIMEZONE="Asia/Shanghai"
NTPSERVER=202.120.2.100
DNSSERVER=202.120.2.100

sed -i.bk -e "s/^nameserver.*/nameserver $DNSSERVER/g" /etc/resolv.conf

# add rpmforge repo
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
rpm -iUv http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

# add EPEL repo
rpm --import https://fedoraproject.org/static/0608B895.txt
rpm -iUv http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# add remi repo
curl http://rpms.famillecollet.com/enterprise/remi.repo -o /etc/yum.repos.d/remi.repo
rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi

# update yum repo
yum clean all && yum check-update

# basic tools
yum -y install tmux vim mailx zsh sudo man bash-completion emacs-nox tree wget lynx curl sshpass nano mlocate

# system tools
yum -y install ntp lvm2 lshw usbutils pciutils denyhosts autofs lvm2 iscsi-initiator-utils scsi-target-utils mdadm nfs-utils

# admin tools
yum install -y  iperf lshw sysstat fio iotop iftop htop iptraf tcpdump mtr tcpdump clusterssh pdsh
yum install -y ganglia-gmond ganglia-gmetad ganglia-gmond-python rrdtool

# security tools
yum install -y denyhosts rkhunter nmap

# development tools
yum groupinstall -y "Development Tools"
yum install -y subversion R gnuplot git git-svn git-cvs lzo-devel snappy-devel zlib-devel ant libcurl-devel openssl-devel libxml2-devel libxslt-devel

# LNMP
yum install -y nginx php mysql-server msyql-clienmaget ImageMagick
yum -y --enablerepo=remi install php-fpm
yum install -y --enablerepo=remi php-cli php-mysql php-gd php-imap php-ldap \
    php-odbc php-pear php-xml php-xmlrpc php-pecl-apc php-gd php-magickwand \
    php-magpierss php-mapserver php-mbstring php-mcrypt php-mhash php-mssql \
    php-shout php-snmp php-soap php-tidy
    
# mail server
yum install -y postfix

# FTP server
yum install -y vsftp

# disable iptables
chkconfig iptables off
chkconfig ip6tables off

# disable SELINUX
sed -i.bk 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# change localtime to Asia/Shanghai
cp /etc/localtime /root/old.timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/$TIMEZONE /etc/localtime

# NTP service
yum install -y ntp ntpdate ntp-doc
# change ntp server and autostart service
ntpdate $NTPSERVER
sed -i.bk -e "s/^server .*$/server $NTPSERVER/1" /etc/ntp.conf
chkconfig ntpd on
/etc/init.d/ntpd restart

# update software
yum update -y

echo "Restart server to enable configurations, exiting."
exit 0;
