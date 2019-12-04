# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	sudo git cp history
	extract
	taskwarrior
	tmux
	tmuxinator
	zsh-autosuggestions
	virtualenvwrapper
	mysql-colorize
	colorize
	encode64
	urltools
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"

# Proxy settings for shadowsocks
alias pc='proxychains'
alias proxy='export OLD_PROMPT="$PROMPT"; \
	export http_proxy=http://127.0.0.1:8123; \
	export https_proxy=http://127.0.0.1:8123; \
	export PROMPT="[PROXY] $PROMPT"'
alias unproxy='export PROMPT=$OLD_PROMPT; \
	unset http_proxy;unset https_proxy; \
	unset OLD_PROMPT'

# zsh-completions
autoload -U compinit && compinit
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# POWERLEVEL9K
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"

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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# k8s
alias k='kubectl'
alias ka='kubectl apply --recursive -f'
alias kex='kubectl exec -i -t'
alias klo='kubectl logs -f'
alias kg='kubectl get'
alias kga='kubectl get --all-namespaces'
alias kd='kubectl describe'

# Rust
export PATH="$HOME/.cargo/bin":$PATH

# Postman
export PATH="/opt/Postman/:$PATH"
