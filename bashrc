# change umask for cooperation
umask 002

# add path for kkbox-script
export PATH="$PATH:$HOME/kkbox-script/kkutil"

# add path for elastic-mapreduce cli interface
export PATH="$PATH:$HOME/software/elastic-mapreduce-cli"


if [ "$TERM" != "dumb" ]; then
    if [ $(uname) == "Linux" ]; then
        # Linux
        # add path for matlab
        export PATH="$PATH:/usr/local/MATLAB/R2012b/bin"

        # add path for scala
        export PATH="$PATH:/usr/local/scala/bin/"

        # add path for spark
        export PATH="$PATH:/usr/local/spark"

        # add path for hadoop
        export PATH="$PATH:/usr/local/hadoop/bin/"
        export HADOOP_HOME="/usr/local/hadoop/"
        export HADOOP_HOME_WARN_SUPPRESS=1

        # add path for pig
        export PIG_INSTALL="/usr/local/pig"
        export PATH="$PATH:$PIG_INSTALL/bin"

        # set java home for hadoop
        export JAVA_HOME="/usr/local/java/"

        alias ls='ls --color=auto'
        LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:cd=5:or=37:mi=0:ex=31'
    else
        # OS X
        # add path for matlab
        export PATH="$PATH:/Applications/MATLAB_R2011b.app/bin"

        # add path for ipython
        export PATH="$PATH:/usr/local/share/python"

        alias ls='ls -GhF'
        export LSCOLORS=dxfxcxdxbxegedabagacad

        # for brew settings
        . $(brew --repository)/Library/Contributions/brew_bash_completion.sh

        # set these for overcoming some warnings in brew doctor
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    fi
    export CLICOLOR=1
fi


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



