## Install
```
sh <(curl -L https://nixos.org/nix/install) --daemon

mkdir ~/Documents/nix-backup/
cp /etc/profile.d/nix.sh.backup-before-nix ~/Documents/nix-backup/
cp /etc/bash.bashrc.backup-before-nix ~/Documents/nix-backup/
cp /etc/zsh/zshrc.backup-before-nix ~/Documents/nix-backup/
cp /etc/profile.d/nix.sh.backup-before-nix ~/Documents/nix-backup/
```

## Uninstall

```
sudo mv ~/Documents/nix-backup/zshrc.backup-before-nix /etc/zsh/zshrc
sudo mv ~/Documents/nix-backup/bash.bashrc.backup-before-nix /etc/bash.bashrc

sudo rm -rf /etc/profile.d/nix.sh.backup-before-nix
sudo rm -rf /etc/bash.bashrc.backup-before-nix
sudo rm -rf /etc/zsh/zshrc.backup-before-nix
sudo rm -rf /etc/profile.d/nix.sh.backup-before-nix

sudo rm -rf /nix/
sudo rm -rf /etc/nix
rm -rf ~/.nix-channels ~/.nix-defexpr ~/.nix-profile
```

