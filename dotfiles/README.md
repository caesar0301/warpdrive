# HowTo

## Zsh with oh-my-zsh
```bash
cp .zshrc ~/.zshrc
sudo apt install zsh fonts-powerline
git clone https://github.com/zplug/zplug ~/.zplug
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
sudo chsh --shell=$(which zsh) $USER
```

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

## Vim

### Vundle
```bash
cp .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
More extensions see [vim-custom.md](https://github.com/caesar0301/warp-drive/blob/master/dotfiles/vim-custom.md)

### SpaceVim (optional)
```bash
curl -sLf https://spacevim.org/install.sh | bash
mkdir ~/.SpaceVim.d/
cp init.toml ~/.SpaceVim.d/
```

Dependencies by lsp and others:
* Java JDT: https://download.eclipse.org/jdtls/snapshots/?d
* Python lsp: `pip install python-language-server`
* Clangd on CentOS
```bash
sudo yum install epel-release
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install clangd --classic
export PATH=/snap/bin:$PATH
```

## References:
* https://blogs.technet.microsoft.com/jessicadeen/linux/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/
* How to tabularize texts, see more https://github.com/godlygeek/tabular
* How to use tabular auto completion, see https://github.com/ervandew/supertab
* code formatter, see more https://github.com/Chiel92/vim-autoformat
