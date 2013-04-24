ONE-STEP INSTALL
----------------

wget (for most Unix)

    wget -O - https://raw.github.com/aaronlin/vimrc/master/auto-install.sh | sh

or curl (for MAC OSX)

    curl -o - https://raw.github.com/aaronlin/vimrc/master/auto-install.sh | sh


MANUALLY INSTALL
----------------

Installation:

    git clone https://github.com/aaronlin/vimrc ~/.vim
    cd .vim
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/bash_profile ~/.bash_profile
    ln -s ~/.vim/screenrc ~/.screenrc
    ln -s ~/.vim/gitconfig ~/.gitconfig

Add a new plugin:

    git submodule add [git_url] bundle/[plugin_name]
    git commit -m "[comment]"
    git push

Remove a plugin:

    Delete the relevant section from the .gitmodules file.
    Delete the relevant section from .git/config.
    Run git rm --cached path_to_submodule (no trailing slash).
    Commit
    Delete the now untracked submodule files
    rm -rf path_to_submodule

Update submodule

    git submodule update
