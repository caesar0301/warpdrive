export PATH=$HOME/bin:$PATH

# Alias
alias pc='proxychains4 -f /usr/local/etc/proxychains.conf'
alias proxy='export OLD_PROMPT="$PROMPT";export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890;export PROMPT="[PROXY] $PROMPT"'
alias noproxy='export PROMPT=$OLD_PROMPT;unset http_proxy;unset https_proxy;unset OLD_PROMPT'

# Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JRE_HOME=$JAVA_HOME/jre
export JAVA_OPTIONS="-Xmx8192m -XX:MaxPermSize=4096m"
export MAVEN_OPTS="-Xmx4096m -XX:MaxPermSize=4096m"

# virtualenvwrapper plugin
export WORKON_HOME=~/.virtualenv

# Go
export GOROOT=/opt/go
export GOPATH=~/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOPROXY=https://goproxy.cn,direct

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Rust
export PATH="$HOME/.cargo/bin":$PATH
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
