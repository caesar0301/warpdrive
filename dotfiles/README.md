# HowTo

Source: https://blogs.technet.microsoft.com/jessicadeen/linux/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/

# oh-my-zsh

```bash
cp .zshrc ~/.zshrc
sudo apt install zsh python-pip curl
sudo pip install virtualenvwrapper
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cd /tmp && git clone https://github.com/powerline/fonts.git &&  sh fonts/install.sh && cd -
sudo chsh --shell=$(which zsh) $USER
```

# Tmux

```bash
cp .tmux.conf ~/.tmux.conf
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Run tmux; Prefix + I to install plugins
```

# Vim

```bash
sudo apt-get install vim python-autopep8

# Install Vundle to manage plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Get .vimrc and run `:PluginInstall` in vim
```
Ref:
* How to tabularize texts, see more https://github.com/godlygeek/tabular
* How to use tabular auto completion, see https://github.com/ervandew/supertab
* code formatter, see more https://github.com/Chiel92/vim-autoformat
