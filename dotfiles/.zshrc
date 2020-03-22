autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv
autoload -U compinit && compinit

# ZPlug
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/history",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "plugins/taskwarrior",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh
zplug "plugins/tmuxinator",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "plugins/jsontools",   from:oh-my-zsh
zplug "plugins/virtualenvwrapper",   from:oh-my-zsh
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "horosgrisa/mysql-colorize" from:githubz

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load 

# General
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vim

# Alias
alias pc='proxychains'
alias proxy='export OLD_PROMPT="$PROMPT";export http_proxy=http://127.0.0.1:1081;export https_proxy=http://127.0.0.1:1081;export PROMPT="[PROXY] $PROMPT"'
alias noproxy='export PROMPT=$OLD_PROMPT;unset http_proxy;unset https_proxy;unset OLD_PROMPT'

# k8s
alias k='kubectl'
alias ka='kubectl apply --recursive -f'
alias kex='kubectl exec -i -t'
alias klo='kubectl logs -f'
alias kg='kubectl get'
alias kga='kubectl get --all-namespaces'
alias kd='kubectl describe'

# Java
export JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_OPTIONS="-Xmx4096m -XX:MaxPermSize=2048m"
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export MAVEN_OPTS="-Xmx4096m -XX:MaxPermSize=2048m"

# virtualenvwrapper plugin
export WORKON_HOME=~/.virtualenv

# Go
export GOROOT=/opt/go
export GOPATH=~/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
go env -w GOPROXY=https://goproxy.cn,direct

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Rust
export PATH="$HOME/.cargo/bin":$PATH

# Postman
export PATH="/opt/Postman/:$PATH"

# Zotero
export PATH="/opt/zotero/:$PATH"

# kubectl auto completion
if [ -e /home/chenxm/bin/kubectl  ]; then source <(kubectl completion zsh); fi
