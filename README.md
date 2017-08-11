# Steven Riehl's dot files

These are config files to set up a system the way I like it.

Vim-users will likely find useful stuff in my [vimrc](vimrc), and also my [Ruby snippets](vim/snippets/ruby.snippets).

I'm also a pretty aggressive aliaser. You might find a few you like in [zsh/aliases](zsh/aliases).

## Installation

    git clone ssh://git@github.com/sriehl/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install

vim plugins are submodules, run the following to install/update them

    git submodule init
    git submodule update

