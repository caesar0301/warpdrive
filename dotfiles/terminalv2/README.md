# HowTo

Source: https://blogs.technet.microsoft.com/jessicadeen/linux/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/

## Install Tmux

```bash
# Install tmux
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# Install oh-my-zsh

```bash
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
```
