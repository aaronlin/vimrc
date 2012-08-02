PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

alias ls='ls -GhF'
alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -kh'
