# set java home for hadoop
JAVA_HOME=/usr
export JAVA_HOME

# set these for numpy
PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# for brew settings
. $(brew --repository)/Library/Contributions/brew_bash_completion.sh

# set these for overcoming some warnings in brew doctor
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

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

PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ " 

# git autocomplete
[ -f ~/.vim/git-bash-completion.sh ] && . ~/.vim/git-bash-completion.sh

# alias setting
alias ls='ls -GhF'
#alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -kh'



# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
