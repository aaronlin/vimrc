One-Step INSTALL
----------------

Installation:

wget (for most Unix)

    wget -O - https://raw.github.com/aaronlin/vimrc/master/auto-install.sh | sh

or curl (for MAC OSX)

    curl -o - https://raw.github.com/aaronlin/vimrc/master/auto-install.sh | sh

MANUALLY INSTALL
----------------

Installation:

    `git clone https://github.com/aaronlin/vimrc ~/.vim`
    `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
    enter vim and type `:BundleInstall`
    `cd ~/.vim/bundle/YouCompleteMe`
    `./install.sh`

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/bashrc ~/.bash_profile
    ln -s ~/.vim/bashrc ~/.bashrc
    ln -s ~/.vim/screenrc ~/.screenrc
    ln -s ~/.vim/gitconfig ~/.gitconfig
    ln -s ~/.vim/tmux.conf ~/.tmux.conf

Add a new plugin:

    add `Bundle 'github repository name'' to vimrc
    enter vim and type `:BundleInstall'

Remove a plugin:

    del the line of `Bundle 'target removed repository name'' in vim
    enter vim and type `:BundleClear'
    remove the directory in .vim/bundle

Update submodule

    enter vim and type `:BundleInstall'


FAQ
----------------

snipmate.vim Error:

    check out ~/.vim/bundle/AutoComplPop/README to find out how to solve it
