export DOTFILES="$HOME/dotfiles"
source $DOTFILES/antibody/antibody.init
alias ls='ls -G'
autoload zmv
source ~/tmuxinator.zsh
export EDITOR='vim'
export PATH=./node_modules/.bin:$PATH
# allow ctr-e and ctrl-a to work on tmux
bindkey -e

# zsh completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------
#  
  alias ga='git add -A'
  alias gp='git push'
  alias gl='git log'
  alias gst='git status'
  alias gd='git diff'
  alias gm='git commit -m'
  alias gma='git commit -am'
  alias gb='git branch'
  alias gc='git checkout'
  alias gra='git remote add'
  alias grr='git remote rm'
  alias gpu='git pull'
  alias gcl='git clone'
  alias gta='git tag -a -m'
  alias gf='git reflog'
  alias gh='git hist'
  alias glg1='git lg1'
  alias glg2='git lg2'
  alias glg='git lg'
