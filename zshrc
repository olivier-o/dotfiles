# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="a2r"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/Users/olivier/.rvm/gems/ruby-1.9.3-p327/bin:/Users/olivier/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/olivier/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/olivier/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin/:/usr/local/bin:/usr/local/sbin:/Users/olivier/.rvm/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
