# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jk"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(jk git rails textmate bundler gem node npm rvm rake)

# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
# appears to fix git branch completion slowness, not sure why...
__git_files () {
  _wanted files expl 'local files' _files
}

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/Users/jk/.gem/ruby/1.8/bin:/Users/jk/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/opt/oracle/instantclient_10_2:/Users/jk/.rvm/bin

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export LC_CTYPE=de_DE.UTF-8

alias grep='grep --color=auto'

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

if [ -s /Users/jk/.rvm/scripts/rvm ] ; then source /Users/jk/.rvm/scripts/rvm ; fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
