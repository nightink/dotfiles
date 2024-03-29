# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR='vim'
# Node.js mirror
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# brew install tree
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# npm mirror
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

alias lv="exa --long --header --git"

alias r="npm run"
alias v="vim package.json"
alias gclean="git branch | egrep -v '\*|m-seaster' | xargs git br -D"
alias f="git commit -m \"f\""
# alias rr = "projj run"

export GPG_TTY=$(tty)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn autojump extract gitignore nvm emoji tmux node colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH=~/.tmpbin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export PROMPT="🤢 $PROMPT"

#Docker
# eval "$(docker-machine env default)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home"
export JAVA_HOME="$(/usr/libexec/java_home -v '1.8.0')"
export PATH=$JAVA_HOME/bin:$PATH
