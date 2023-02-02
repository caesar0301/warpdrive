#!/bin/bash
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
thispath=$(dirname $abspath)

# Change to 0 to install a copy instead of soft link
SOFTLINK=1

function install_zsh() {
    echo "Configuring zsh..."
    if [ -e $HOME/.zi ]; then
        echo "~/.zi existed, skip"
    else
        mkdir $HOME/.zi
        git clone https://github.com/z-shell/zi.git ~/.zi/bin
    fi
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/zsh/zshrc $HOME/.zshrc
    else
        cp $thispath/zsh/zshrc $HOME/.zshrc
    fi
    echo "Zsh configured"
}

function install_vim() {
    echo "Configuring vim..."
    mkdir -p $HOME/.config/nvim
    cp $thispath/vim/nvim/init.vim $HOME/.config/nvim/init.vim
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/vim/vimrc $HOME/.vimrc
    else
        cp $thispath/vim/vimrc $HOME/.vimrc
    fi
    echo "Vim configured, run :PlugInstall to install plugins"
}

function install_tmux() {
    echo "Configuring tmux..."
    mkdir -p $HOME/.tmux/plugins
    if [ -e $HOME/.tmux/plugins/tpm ]; then
        echo "$HOME/.tmux/plugins/tpm existed, skip"
    else
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/tmux/tmux.conf $HOME/.tmux.conf
    else
        cp $thispath/tmux/tmux.conf $HOME/.tmux.conf
    fi
    echo "Tmux configured, run <prefix>I to install plugins"
}

install_zsh
install_tmux
install_vim