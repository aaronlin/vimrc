MANUALLY INSTALL
----------------

Requirement:

    vim version 7.584 or later

Installation:

    `git clone https://github.com/aaronlin/vimrc ~/.vim`
    `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
    enter vim and type `:BundleInstall`
    `cd ~/.vim/bundle/YouCompleteMe`
    `./install.sh`

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/bash_profile ~/.bash_profile
    ln -s ~/.vim/screenrc ~/.screenrc
    ln -s ~/.vim/gitconfig ~/.gitconfig

Add a new plugin:

    add `Bundle 'github repository name'' to vimrc
    enter vim and type `:BundleInstall'

Remove a plugin:

    del the line of `Bundle 'target removed repository name'' in vim
    enter vim and type `:BundleClear'
    remove the directory in .vim/bundle

Update submodule

    enter vim and type `:BundleInstall'
