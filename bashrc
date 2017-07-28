# set encoding
export LANG=en_US.UTF-8

# change umask for cooperation
umask 002

# add path for self specific executions
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/git/company/kkbox-script/kkutil"

# extend history to unlimit size
export HISTFILESIZE=
export HISTSIZE=

# add path for elastic-mapreduce cli interface
export PATH="$PATH:$HOME/git/software/elastic-mapreduce-ruby"

source "$HOME/.vim/aws.conf"
source "$HOME/.vim/spark.conf"

if [ "$TERM" != "dumb" ]; then
    if [ $(uname) == "Linux" ]; then
        # Linux

        # add path for scala
        export PATH="$PATH:/usr/local/scala/bin/"

        # add path for spark
        export PATH="$PATH:/usr/local/spark"

        alias ls='ls --color=auto'
        LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:cd=5:or=37:mi=0:ex=31'
    else
        # OS X
        # add path for pip
        export PATH="$PATH:/usr/local/share/python"

        export SCALA_HOME="/usr/local/scala"
        export PATH="$PATH:$SCALA_HOME/bin"
        export SPARK_HOME="/usr/local/spark"
        export PATH="$PATH:$SPARK_HOME/bin"
        export PATH="$PATH:$SPARK_HOME/ec2"

        alias ls='ls -GhF'
        export LSCOLORS=dxfxcxdxbxegedabagacad

        # for brew settings
        . $(brew --repository)/Library/Contributions/brew_bash_completion.sh

        # set these for overcoming some warnings in brew doctor
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH

        # add gpsbabelfe
        export PATH="$PATH:/Applications/GPSBabelFE.app/Contents/MacOS/"
    fi
    export CLICOLOR=1
fi

# add gitignore generator function
function gi() { curl http://www.gitignore.io/api/$@ ;}


# command line coloring for git
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));

    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

PS1="\[\033[1;30m\]\u@\h\[\033[0m\] [\[\033[1;32m\]\w\[\033[0m\]] \[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "

# git autocomplete
[ -f ~/.vim/git-bash-completion.sh ] && . ~/.vim/git-bash-completion.sh

# alias setting
alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias ll='ls -lh'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -kh'
alias grep='grep --color'



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by Anaconda3 4.0.0 installer
export PATH="/Users/aaronlin/anaconda/bin:$PATH"

# added by Anaconda3 4.3.1 installer
export PATH="/anaconda/bin:$PATH"
