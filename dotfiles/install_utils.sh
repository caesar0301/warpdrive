#!/bin/bash
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
thispath=$(dirname $abspath)

UNAMEO=$(uname -s)

function install_pyenv() {
    if [ -e $HOME/.pyenv ]; then
        echo "$HOME/.pyenv existed, skip"
    else
        git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
    fi
}

function install_fzf() {
    if [ x$UNAMEO == "xLinux" ] || [ x$UNAMEO == "xCYGWIN" ] || [ x$UNAMEO == "xMINGW" ]; then
        if [ -e $HOME/.fzf ]; then
            echo "$HOME/.fzf existed, skip"
        else
            git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
            $HOME/.fzf/install
        fi
    elif [ x$UNAMEO == "xDarwin" ]; then
        brew install fzf
        $(brew --prefix)/opt/fzf/install
    fi
}

# autoformat
npm install -g remark-cli js-beautify
gem install ruby-beautify

install_pyenv
install_fzf
