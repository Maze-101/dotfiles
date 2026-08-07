#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH"

bind '"\x08": backward-kill-word'
eval "$(starship init bash)"

alias ff='fastfetch'

######## system ########
alias u='doas apt update'
alias i='doas apt install'
alias p='doas systemctl poweroff'

# >>> Codex installer >>>
export PATH="/home/shiki/.local/bin:$PATH"
# <<< Codex installer <<<
