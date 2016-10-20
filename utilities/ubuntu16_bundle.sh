#!/bin/bash
# set -e

# Add third-party ppas
sudo apt-add-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:smathot/cogscinl

# update yum repo
sudo apt-get update

# basics
sudo apt-get install -y sublime-text-installer tmux vim zsh bash-completion emacs tree wget curl sshpass nano mlocate virtualbox gparted exfat-utils openvpn indicator-multiload openssh-server openssh-client python-pip sysv-rc-conf fcitx

# system
sudo apt-get install -y ntp lvm2 lshw usbutils pciutils denyhosts autofs mdadm iperf lshw sysstat fio iotop iftop htop iptraf tcpdump mtr tcpdump clusterssh pdsh nmap

# development
sudo apt-get install -y build-essential subversion r-base r-base-dev r-base-core gnuplot git git-svn git-cvs ant libcurl3 libcurl4-openssl-dev openssl libxml2-dev libxslt-dev maven libssl-dev exuberant-ctags

sudo pip install -U dbgp vim-debug pep8 flake8 pyflakes isort

# Java and Scala
sudo apt-get remove -y openjdk-*-jre-*
sudo apt-get purge -y openjdk*
sudo apt-get install -y oracle-java7-installer oracle-java7-set-default scala

# Sogou input and WPS
curl http://cdn2.ime.sogou.com/dl/index/1465191139/sogoupinyin_2.0.0.0078_amd64.deb?st=hBYrFcS3EvCOkTfsqNK3cA&e=1465736249&fn=sogoupinyin_2.0.0.0078_amd64.deb -o sogoupinyin_2.0.0.0078_amd64.deb
sudo apt-get install -y sogoupinyin_2.0.0.0078_amd64.deb
sudo apt-get update
# WPS in ubuntukylin repo
# Fix GPG key error:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3C962022012520A0
# replace final key with yours
sudo apt-get install wps-office

# Zotero
sudo apt-get install zotero-standalone

# Media players
sudo apt-get install mpv smplayer

sudo apt-get autoremove

# Install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl https://raw.githubusercontent.com/caesar0301/warp-drive/master/dotfiles/.tmux.conf -o ~/.tmux.conf

# R DEV
curl https://raw.githubusercontent.com/caesar0301/warp-drive/master/dotfiles/.Rprofile -o ~/.Rprofile

# SPACEMACS
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# VIM
curl https://raw.githubusercontent.com/fisadev/fisa-vim-config/master/.vimrc -o ~/.vimrc

exit 0;
