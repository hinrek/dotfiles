#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Open files by default
export VISUAL="vim"

# Aliases
alias ls='ls --color=auto'
alias update='echo -e "\e[1;35mRunning sudo pacman -Syyu\e[0m" && sudo pacman -Syyu && echo -e "\e[1;35mFinished updating!!!\e[0m"'

PS1='[\u@\h \W]\$ '

# Enviroment exports
## Ranger to load only config in user folder
export RANGER_LOAD_DEFAULT_RC=FALSE

# For BASE16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# Run when new bash is started

# Run fish shell
#exec fish
