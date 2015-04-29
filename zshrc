# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

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
[[ -s "/Users/ben/.rvm/scripts/rvm" ]] && source "/Users/ben/.rvm/scripts/rvm"

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
plugins=(git brew ruby colorize gem heroku node npm osx sudo tmux)

source $ZSH/oh-my-zsh.sh

export PATH="/Users/sriehl/bin:/Users/sriehl/.rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/sbin:/usr/local/bin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/MacGPG2/bin"
eval "$(rbenv init -)"

export EDITOR='vim'

alias crontab="VIM_CRONTAB=true crontab"

export GOPATH=$HOME/go
export GOROOT=`go env GOROOT`
#export GOROOT="/usr/local/Cellar/go/1.4.1/libexec"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Oracle env vars
export NLS_LANG=AMERICAN_AMERICA.UTF8
export ORACLE_HOME=~/oracle/instantclient_11_2/
export DYLD_LIBRARY_PATH=$ORACLE_HOME

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias server="ruby -run -e httpd -- -p 5000 ."
alias serversync='browser-sync start --server --files "*"'
alias tunnel="ssh -D6500 ssh.stevenriehl.com"

export PATH=$PATH:bin:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin
