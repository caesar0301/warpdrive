#!/bin/bash
set +x

ZSH_CUSTOM="~/.oh-my-zsh/custom"

# Install on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Powerline theme for ZSH
git clone https://github.com/bhilburn/powerlevel9k.git "$ZSH_CUSTOM/themes/powerlevel9k"
cd /tmp && git clone https://github.com/powerline/fonts.git &&  sh fonts/install.sh && cd -

git clone https://github.com/horosgrisa/mysql-colorize "$ZSH_CUSTOM/plugins/mysql-colorize"

# Spaceship theme for ZSH
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

