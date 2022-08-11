# HowTo

## Tmux
```bash
cp .tmux.conf ~/.tmux.conf
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Run tmux; Prefix + I to install plugins
```
Support true color with vim
1. On the local system, dump the description to text format:
```
infocmp xterm-256color > xterm-256color.ti
infocmp screen-256color > screen-256color.ti
```
2. Copy to the remote host and compile (to `~/.terminfo`)
```
tic xterm-256color.ti
tic screen-256color.ti
```
