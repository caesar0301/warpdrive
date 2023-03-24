#!/bin/bash
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
thispath=$(dirname $abspath)

# Change to 0 to install a copy instead of soft link
SOFTLINK=1

function install_zsh() {
    if [ -e $HOME/.zi ]; then
        echo "WARNING: $HOME/.zi existed, skip"
    else
        typeset -Ag ZI
        typeset -gx ZI[HOME_DIR]="${HOME}/.zi" ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"
        command mkdir -p "$ZI[BIN_DIR]"
        compaudit | xargs chown -R "$(whoami)" "$ZI[HOME_DIR]"
        compaudit | xargs chmod -R go-w "$ZI[HOME_DIR]"
        command git clone https://github.com/z-shell/zi.git "$ZI[BIN_DIR]"
    fi
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/zsh/zshrc $HOME/.zshrc
    else
        cp $thispath/zsh/zshrc $HOME/.zshrc
    fi
    echo "INFO: zsh configured"
}

function install_vim() {
    mkdir -p $HOME/.config/nvim
    cp $thispath/vim/nvim/init.vim $HOME/.config/nvim/init.vim
    mkdir -p $HOME/.vim/autoload
    cp $thispath/vim/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
    mkdir -p $HOME/.local/share/nvim/site/autoload
    cp $thispath/vim/vim-plug/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/vim/vimrc $HOME/.vimrc
    else
        cp $thispath/vim/vimrc $HOME/.vimrc
    fi
    echo "INFO: vim configured, run :PlugInstall to install plugins"
}

function install_tmux() {
    mkdir -p $HOME/.tmux/plugins
    if [ -e $HOME/.tmux/plugins/tpm ]; then
        echo "WARNING: $HOME/.tmux/plugins/tpm existed, skip"
    else
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/tmux/tmux.conf $HOME/.tmux.conf
    else
        cp $thispath/tmux/tmux.conf $HOME/.tmux.conf
    fi
    echo "INFO: tmux configured, run <prefix>I to install plugins"
}

function install_emacs() {
    if [ -e $HOME/.emacs.d ]; then
        echo "WARNING: $HOME/.emacs.d existed, skip"
    else
        mkdir ~/.emacs.d
    fi
    if [ -e $HOME/.emacs.d/settings ]; then
        rm -rf $HOME/.emacs.d/settings
    fi
    if [ x$SOFTLINK == "x1" ]; then
        ln -sf $thispath/emacs/.emacs.d/settings $HOME/.emacs.d/settings
        ln -sf $thispath/emacs/.emacs.d/init.el $HOME/.emacs.d/init.el
    else
        cp -r $thispath/emacs/.emacs.d/settings $HOME/.emacs.d/
        cp $thispath/emacs/.emacs.d/init.el $HOME/.emacs.d/
    fi
    echo "INFO: emacs configured"
}

install_zsh
install_tmux
install_vim
install_emacs
