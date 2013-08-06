#!/bin/sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone git://github.com/aaronlin/vimrc.git ~/.vim

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/bashrc ~/.bashrc
ln -s ~/.vim/bashrc ~/.bash_profile
ln -s ~/.vim/screenrc ~/.screenrc
ln -s ~/.vim/gitconfig ~/.gitconfig

vi

echo "vimrc is installed."
