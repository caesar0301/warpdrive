#!/bin/bash
# set -e

# Useful PPAs
sudo apt-add-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:smathot/cogscinl
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt-add-repository -y ppa:mmk2410/intellij-idea-community

# Install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# update yum repo
sudo apt-get update

# basics
sudo apt-get install -y tmux vim zsh bash-completion emacs tree wget curl sshpass nano mlocate virtualbox gparted exfat-utils openvpn indicator-multiload openssh-server openssh-client python-pip sysv-rc-conf fcitx mpv smplayer zotero-standalone

# system
sudo apt-get install -y ntp lvm2 lshw usbutils pciutils denyhosts autofs mdadm iperf lshw sysstat fio iotop iftop htop iptraf tcpdump mtr tcpdump clusterssh pdsh nmap

# development
sudo apt-get install -y build-essential subversion r-base r-base-dev r-base-core gnuplot git git-svn git-cvs ant libcurl3 libcurl4-openssl-dev openssl libxml2-dev libxslt-dev maven libssl-dev exuberant-ctags sbt sublime-text-installer ubuntu-make intellij-idea-community

sudo pip install -U dbgp vim-debug pep8 flake8 pyflakes isort

# Java and Scala
sudo apt-get remove -y openjdk-*-jre-*
sudo apt-get purge -y openjdk*
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default scala

# WPS in ubuntukylin repo
# Fix GPG key error:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3C962022012520A0
# replace final key with yours
# sudo apt-get install wps-office

sudo apt-get autoremove

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
