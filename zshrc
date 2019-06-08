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

        alias ls='ls --color=auto'
        LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:cd=5:or=37:mi=0:ex=31'
    else
        # add gpsbabelfe
        export PATH="$PATH:/Applications/GPSBabelFE.app/Contents/MacOS/"

        # add path for anaconda
        export PATH="/anaconda/bin:$PATH"

        # add path for iftop
        export PATH="/usr/local/sbin:$PATH"

        # add path to awc-mfa
        export PATH="/Users/aaron_lin/git/airbnb/awc-mfa/bin:$PATH"

        # treehouse setup
        export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
        export PATH=$JAVA_HOME/bin:$PATH
    fi
fi

# extend history to unlimit size
export HISTFILESIZE=
export HISTSIZE=

# add gitignore generator function
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

export PATH="/Users/aaron_lin/sandbox/chinese-nlp-test/fasttext/fastText-0.1.0:$PATH"

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

# hub
eval "$(hub alias -s)"
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
export GITHUB_HOST=git.musta.ch

# ssh and tmux
function ssh () {/usr/bin/ssh -t $@ "tmux attach || tmux new";}

# afdev
export DATA_DIR=$HOME/git/airbnb/data #PATH WHERE YOU CLONED THE DATA REPO
export AFDEV_HOST=13.229.48.145
export AFDEV_PORT=65500

# airbnb related
alias ml-ssh="ssh -N -f -L localhost:8888:localhost:8889 ml-instance"
alias ml-check="ps aux | grep ml-instance"
alias mywork-get="rsync -av --delete --exclude '.git' --exclude 'docs/embeddings' --exclude 'docs/.ipynb_checkpoints/' ml-instance:~/git/airbnb/aaron-exp/ ~/git/airbnb/aaron-exp/"
alias mywork-put="rsync -av --delete --exclude '.git' --exclude 'docs/embeddings' --exclude 'docs/.ipynb_checkpoints/' ~/git/airbnb/aaron-exp/ ml-instance:~/git/airbnb/aaron-exp/"
alias airflow1="export AFDEV_HOST=13.229.48.145"
alias airflow2="export AFDEV_HOST=13.250.117.22"
alias airflow3="export AFDEV_HOST=13.229.120.170"
alias airflow-silver="export AFDEV_HOST=i-078451d40df2bd96f.inst.aws.airbnb.com"
alias dg_silver='ssh -N -f -L localhost:5712:presto-coordinator-prod-1.synapse:5712 silver1'
alias dg='ssh -N -f -L localhost:4161:presto-coordinator-jade.synapse:4161 jade1'
alias dg_check='ps aux | grep jade1'

# others
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
alias zshrc="source ~/.zshrc"
alias git-pr-link="git pr list -h $(git rev-parse --abbrev-ref HEAD) -f '%sC%>(8)%i%Creset %t: %U %n'"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aaron_lin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aaron_lin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aaron_lin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aaron_lin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export GOOGLE_APPLICATION_CREDENTIALS='/Users/aaron_lin/Dropbox/keys/Translation-e37907bbbb09.json'

# libfm
export PATH="$PATH:/Users/aaron_lin/git/public/libfm/libfm-1.42.src/bin"
