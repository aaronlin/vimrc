# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(zsh-autosuggestions)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
[ -f $HOME/.vim/aws.conf ] && source $HOME/.vim/aws.conf
[ -f $HOME/.vim/spark.conf ] && source ~/.vim/spark.conf

if [ "$TERM" != "dumb" ]; then
    if [ $(uname) = "Linux" ]; then
        # Linux
        export SCALA_HOME="/usr/local/scala"
        export PATH="$PATH:$SCALA_HOME/bin"
        export SPARK_HOME="/usr/local/spark"
        export PATH="$PATH:$SPARK_HOME/bin"
        export PATH="$PATH:$SPARK_HOME/ec2"

        alias ls='ls --color=auto'
        LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:cd=5:or=37:mi=0:ex=31'
    else
        # OS X
        export SCALA_HOME="/usr/local/scala"
        export PATH="$PATH:$SCALA_HOME/bin"
        export SPARK_HOME="/usr/local/spark"
        export PATH="$PATH:$SPARK_HOME/bin"
        export PATH="$PATH:$SPARK_HOME/ec2"
        export PATH="$PATH:/Users/aaronlin/bin"

        # add gpsbabelfe
        export PATH="$PATH:/Applications/GPSBabelFE.app/Contents/MacOS/"

        # add path to jira cli
        alias jira='/usr/local/atlassian-cli-4.4.0/jira.sh'

        # add path for anaconda
        export PATH="/Users/aaronlin/anaconda/bin:$PATH"
    fi
fi

# extend history to unlimit size
export HISTFILESIZE=
export HISTSIZE=

# add gitignore generator function
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vi=vim
alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias ll='ls -lh'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -kh'
alias grep='grep --color'
alias git-prune="git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print \$1}' | xargs git branch -d"