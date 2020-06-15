#!/bin/bash

# sshpass with plain password
ssh -o ProxyCommand="sshpass -p your_password ssh -p 10000 user@gatewayip -W %h:%p" "$@"
scp -o ProxyCommand="sshpass -p your_password ssh -p 10000 user@gatewayip -W %h:%p" "$@"

# sshpass with gpged password
echo "your_password" > ~/.ssh/.sshpass
gpg -c ~/.ssh/.sshpass
gpg -d -q ~/.ssh/.sshpass.gpg > fifo; sshpass -f fifo ssh -p 10000 user@gatewayip
ssh -o ProxyCommand="gpg -d -q ~/.ssh/.sshpass.gpg > /tmp/fifo; sshpass -f /tmp/fifo ssh -p 10000 user@gatewayip -W %h:%p" user@targetip 

# gpg without password promt
echo gpg_password | gpg --batch --yes --passphrase-fd 0 your_file.gpg

# with .ssh/config, https://serverfault.com/a/701884
Host sw_jump
  Hostname 61.164.33.194
  Port 3700
  User root
  IdentityFile ~/.ssh/id_rsa
  ControlPath ~/.ssh/controlmasters/%r@%h:%p
  ControlMaster auto

Host sw_huigui
  Hostname vm010008014096
  User admin
  Port 22
  IdentityFile ~/.ssh/id_rsa
  ForwardAgent yes
  # ProxyJump sw_jump
  ProxyCommand ssh sw_jump 'ssh-add && nc %h %p'
