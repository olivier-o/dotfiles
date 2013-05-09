# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export PATH=/var/lib/gems/1.8/bin:$PATH
export PATH=~/android/android-sdk-linux_86/tools:$PATH
export PATH=$PATH:/opt/android-sdk/tools
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

###############################################################################
# PROMPT
###############################################################################
 
###############################################################################
# Terminal Title
 
set_terminal_title() {
    if [[ -z $@ ]]
    then
        TERMINAL_TITLE=$PWD
    else
        TERMINAL_TITLE=$@
    fi
}
alias stt='set_terminal_title'
STANDARD_PROMPT_COMMAND='history -a ; echo -ne "\033]0;${TERMINAL_TITLE}\007"'
PROMPT_COMMAND=$STANDARD_PROMPT_COMMAND
 
###############################################################################
# Parses Git info for prompt
 
function _set_git_envar_info {
    GIT_BRANCH=""
    GIT_HEAD=""
    GIT_STATE=""
    GIT_LEADER=""
    GIT_ROOT=""
    if [[ $(which git 2> /dev/null) ]]
    then
        local STATUS
        STATUS=$(git status 2>/dev/null)
        if [[ -z $STATUS ]]
        then
            return
        fi
        GIT_LEADER=":"
        GIT_BRANCH="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
        GIT_HEAD=":$(git show --quiet --pretty=format:%h 2> /dev/null)"
        GIT_ROOT=./$(git rev-parse --show-cdup)
        if [[ "$STATUS" == *'working directory clean'* ]]
        then
            GIT_STATE=""
        else
            GIT_HEAD=$GIT_HEAD":"
            GIT_STATE=""
            if [[ "$STATUS" == *'Changes to be committed:'* ]]
            then
                GIT_STATE=$GIT_STATE'+I' # Index has files staged for commit
            fi
            if [[ "$STATUS" == *'Changed but not updated:'* ]]
            then
                GIT_STATE=$GIT_STATE"+M" # Working tree has files modified but unstaged
            fi
            if [[ "$STATUS" == *'Untracked files:'* ]]
            then
                GIT_STATE=$GIT_STATE'+U' # Working tree has untracked files
            fi
            GIT_STATE=$GIT_STATE''
        fi
    fi
}
 
###############################################################################
# Composes prompt.
function setps1 {
 
    # Help message.
    local USAGE="Usage: setps1 [none] [screen=<0|1>] [user=<0|1>] [dir=<0|1|2>] [git=<0|1>] [wrap=<0|1>] [which-python=<0|1>]"
 
    if [[ (-z $@) || ($@ == "*-h*") || ($@ == "*--h*") ]]
    then
        echo $USAGE
        return
    fi
 
    # Prompt colors.
    local CLEAR="\[\033[0m\]"
    local STY_COLOR='\[\033[1;37;41m\]'
    local PROMPT_COLOR='\[\033[1;94m\]'
    local USER_HOST_COLOR='\[\033[1;30m\]'
    local PROMPT_DIR_COLOR='\[\033[1;94m\]'
    local GIT_LEADER_COLOR='\[\033[1;30m\]'
    local GIT_BRANCH_COLOR=$CLEAR'\[\033[1;90m\]\[\033[4;90m\]'
    local GIT_HEAD_COLOR=$CLEAR'\[\033[1;32m\]'
    local GIT_STATE_COLOR=$CLEAR'\[\033[1;31m\]'
 
    # Hostname-based colors in prompt.
    if [[ $HOSTNAME != $PRIMARYHOST ]]
    then
        USER_HOST_COLOR=$REMOTE_USER_HOST_COLOR
    fi
 
    # Start with empty prompt.
    local PROMPTSTR=""
 
    # Set screen session id.
    if [[ $@ == *screen=1* ]]
    then
        ## Decorate prompt with indication of screen session ##
        if [[ -z "$STY" ]] # if screen session variable is not defined
        then
            local SCRTAG=""
        else
            local SCRTAG="$STY_COLOR(STY ${STY%%.*})$CLEAR" # get screen session number
        fi
    fi
 
    # Set user@host.
    if [[ $@ == *user=1* ]]
    then
         PROMPTSTR=$PROMPTSTR"$USER_HOST_COLOR\\u@\\h$CLEAR"
    fi
 
    # Set directory.
    if [[ -n $PROMPTSTR && ($@ == *dir=1* || $@ == *dir=2*) ]]
    then
            PROMPTSTR=$PROMPTSTR"$PROMPT_COLOR:"
    fi
 
    if [[ $@ == *dir=1* ]]
    then
        PROMPTSTR=$PROMPTSTR"$PROMPT_DIR_COLOR\W$CLEAR"
    elif [[ $@ == *dir=2* ]]
    then
        PROMPTSTR=$PROMPTSTR"$PROMPT_DIR_COLOR\$(pwd -P)$CLEAR"
    fi
 
#     if [[ $@ == *dir=1* ]]
#     then
#         PROMPTSTR=$PROMPTSTR"$PROMPT_DIR_COLOR\W$CLEAR"
#     elif [[ $@ == *dir=2* ]]
#     then
#         PROMPTSTR=$PROMPTSTR"$PROMPT_DIR_COLOR\w$CLEAR"
#     fi
#
    # Set git.
    if [[ $@ == *git=1* ]]
    then
        PROMPT_COMMAND="$STANDARD_PROMPT_COMMAND && _set_git_envar_info"
        PROMPTSTR=$PROMPTSTR"$BG_COLOR$GIT_LEADER_COLOR\$GIT_LEADER$GIT_BRANCH_COLOR"
        PROMPTSTR=$PROMPTSTR"\$GIT_BRANCH$GIT_HEAD_COLOR\$GIT_HEAD$GIT_STATE_COLOR\$GIT_STATE$CLEAR"
    else
        PROMPT_COMMAND=$STANDARD_PROMPT_COMMAND
    fi
 
    # Set wrap.
    if [[ $@ == *wrap=1* ]]
    then
        local WRAP="$CLEAR\n"
    else
        local WRAP=""
    fi
 
    # Set wrap.
    if [[ $@ == *which-python=1* ]]
    then
        local WHICHPYTHON="$CLEAR\n(python is '\$(which python)')$CLEAR\n"
    else
        local WHICHPYTHON=""
    fi
 
    # Finalize.
    if [[ -z $PROMPTSTR || $@ == none ]]
    then
        PROMPTSTR="\$ "
    else
        PROMPTSTR="$TITLEBAR\n$SCRTAG${PROMPT_COLOR}[$CLEAR$PROMPTSTR$PROMPT_COLOR]$WRAP$WHICHPYTHON$PROMPT_COLOR\$$CLEAR "
    fi
 
    # Set.
    PS1=$PROMPTSTR
    PS2='> '
    PS4='+ '
}
 
alias setps1-long='setps1 screen=1 user=1 dir=2 git=1 wrap=1'
alias setps1-short='setps1 screen=1 user=1 dir=1 git=1 wrap=0'
alias setps1-default='setps1-short'
alias setps1-plain='setps1 screen=0 user=0 dir=0 git=0 wrap=0'
alias setps1-nogit='setps1 screen=0 user=1 dir=1 git=0 wrap=0'
alias setps1-local-long='setps1 screen=1 user=0 dir=2 git=1 wrap=1'
alias setps1-local-short='setps1 screen=0 user=0 dir=1 git=1 wrap=0'
alias setps1-local='setps1-local-short'
alias setps1-dev-short='setps1 screen=0 user=0 dir=1 git=1 wrap=0 which-python=1'
alias setps1-dev-long='setps1 screen=0 user=1 dir=2 git=1 wrap=0 which-python=1'
alias setps1-dev-remote='setps1 screen=0 user=1 dir=1 git=1 wrap=0 which-python=1'

setps1 screen=1 user=1 dir=1 git=1 wrap=0 which-python=0

