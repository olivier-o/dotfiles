export DOTFILES="$HOME/dotfiles"
source $DOTFILES/antibody/antibody.init
alias ls='ls -G'
autoload zmv
source ~/tmuxinator.zsh
export EDITOR='vim'
export PATH=./bin:./node_modules/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export NODE_PATH=/usr/local/lib/node_modules
export SAVEHIST=10000 # nmber of commands history file can hold (equal or larger than HISTSIZE)
export HISTSIZE=10000 # number of commands from history file loaded into the shell’s memory
export HISTFILE=~/.zsh_history
setopt inc_append_history
#no duplicates are saved
setopt HIST_IGNORE_ALL_DUPS
# share history between shell as history get saved
setopt share_history
# allow ctr-e and ctrl-a to work on tmux
bindkey -e
# bind Arrow Up and Arrow Down to history search
# https://github.com/zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# zsh completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
# ruby version management
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
# chruby ruby-2.7.2
# -------------------------------------------------------------------
# npm aliases
# -------------------------------------------------------------------
  alias nr='npm run '
# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------
#  
  alias ga='git add -A'
  alias gap='git add -p'
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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(rbenv init - zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

