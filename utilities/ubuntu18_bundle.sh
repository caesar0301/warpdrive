#!/bin/bash

sudo apt install ubuntu-make

umake ide idea-ultimate

umake ide sublime-text

umake ide visual-studio-code

umake go

umake scala

# Java
# Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt update

# Java 10
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update

# Set java default
sudo apt install oracle-java8-set-default
sudo apt install oracle-java10-set-default

# Install mysql
sudo apt-get purge mysql-server
sudo apt-get purge mysql-common
sudo rm -rf /var/log/mysql
sudo rm -rf /var/log/mysql.*
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
sudo apt-get install -y mysql-server mysql-common --fix-missing --fix-broken
