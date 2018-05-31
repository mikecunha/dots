# save all the histories
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# don't put duplicate lines or empty spaces in the history
export HISTCONTROL=ignoreboth
 
# combine multiline commands in history
shopt -s cmdhist

# merge session histories
shopt -s histappend

# Ctrl+D must be pressed twice
export IGNOREEOF=1

# expand shortened urls
function expandurl {
    curl -sIL $1 | grep ^Location;
}

# Git
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

### COLORS ###
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
ORANGE="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BLACK="\[\033[0;30m\]"
GRAY="\[\033[1;30m\]"
NO_COLOR="\[\e[0m\]"

# force ls to always use color and type indicators
alias ls='ls -hFGC'
 
# make grep highlight results using color
export GREP_OPTIONS='--color=auto'

# colorful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' # end the info box
export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### PROMPT ###
export PS1="${CYAN}\h:\w\n${WHITE}[\!] ${YELLOW}\$(date +%I:%M:%S) \u${WHITE}:${CYAN}\$(parse_git_branch) ${NO_COLOR}\$ "

# corrects typos (eg: cd /ect becomes cd /etc)
shopt -s cdspell
 
# resize ouput to fit window
shopt -s checkwinsize
