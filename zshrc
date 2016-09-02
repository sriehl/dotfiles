# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# Show contents of directory after cd-ing into it
#chpwd() {
#  ls -lrthG
#}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Enable completion
autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# RVM
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"

# Sourcing of other files
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions
#source $HOME/.dotfiles/zsh/prompt
#source $HOME/.dotfiles/zsh/z

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew ruby colorize gem osx sudo)

source $ZSH/oh-my-zsh.sh

#export PATH="/Users/sriehl/bin:/Users/sriehl/.rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/sbin:/usr/local/bin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/MacGPG2/bin"
#eval "$(rbenv init -)"

#export PATH="~/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Applications/Postgres.app/Contents/Versions/latest/bin"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

new_ruby_project() {
    echo $RUBY_AUTO_VERSION >> .ruby-version
    echo 'PATH_add bin' >> .envrc
    direnv allow
    bundle init
    bundle install --path vendor
    bundle package --all
    echo 'vendor/ruby' >> .gitignore
    echo 'vendor/cache' >> .gitignore
}

#eval "$(direnv hook zsh)"

export EDITOR='vim'

export GOPATH=$HOME/go
export GOROOT=`go env GOROOT`
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

#export PATH="$PATH:/usr/local/CrossPack-AVR/bin"

# Oracle env vars
export NLS_LANG=AMERICAN_AMERICA.UTF8
#export ORACLE_HOME=~/oracle/instantclient_11_2/
#export ORACLE_HOME=/opt/oracle/instantclient
#export DYLD_LIBRARY_PATH=$ORACLE_HOME/sdk
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient/sdk
#export CGO_CFLAGS=-I/opt/oracle/instantclient/sdk/include
#export CGO_LDFLAGS=-L/opt/oracle/instantclient

#export PATH=$PATH:bin:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin

