#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ ! $DISPLAY && $(tty) = "/dev/tty1" ]] && startx

export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="flatpak run com.visualstudio.code"
export NOTES="obsidian"
. "$HOME/.local/bin/env"
