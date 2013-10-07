### Installation

    git clone git://github.com/vincecarney/dotfiles.git

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd dotfiles
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/global-gitignore ~/.gitignore

### Vim Plugin Bundles

Plugins that are published on github can be installed as submodules. For
example:

    cd ~/dotfiles
    git submodule add http://github.com/example/vim-foobar.git vim/bundle/vim-foobar

This will update the `.gitmodules` file by appending something like:

    [submodule "vim/bundle/vim-foobar"]
        path = vim/bundle/vim-foobar
        url = http://github.com/example/vim-foobar.git
    
As well as checkout out the git repo into the
`vim/bundle/vim-foobar` directory. You can then commit these changes
as follows:

    git add .
    git commit -m "Added the foobar bundle"
