# HowTo

Source: https://blogs.technet.microsoft.com/jessicadeen/linux/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/

# Config Tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

# Install oh-my-zsh

```bash
sudo chsh --shell=/bin/zsh $USER
sudo pip install virtualenvwrapper

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

cd /tmp && git clone https://github.com/powerline/fonts.git &&  sh fonts/install.sh && cd -
```

# Install vim

Ref：https://realpython.com/vim-and-python-a-match-made-in-heaven/

```bash
# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Get .vimrc and run `:PluginInstall` in vim

# Install code formatter, see more https://github.com/Chiel92/vim-autoformat
sudo apt-get install python-autopep8

# How to tabularize texts, see more https://github.com/godlygeek/tabular

# How to use tabular auto completion, see https://github.com/ervandew/supertab
```
