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
Host jump
  Hostname 1.2.3.4
  Port 8022
  User root
  IdentityFile ~/.ssh/id_rsa
  ControlPath ~/.ssh/controlmaster-%r@%h:%p
  ControlMaster auto

Host hidden
  Hostname hidden.hostname
  User admin
  Port 22
  IdentityFile ~/.ssh/id_rsa
  ForwardAgent yes
  # ProxyJump jump
  ProxyCommand ssh jump 'ssh-add && nc %h %p'
