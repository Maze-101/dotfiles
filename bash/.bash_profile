#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ ! $DISPLAY && $(tty) = "/dev/tty1" ]] && startx

export TERMINAL="alacritty"
export BROWSER="brave"
export EDITOR="flatpak run com.visualstudio.code"
export NOTES="zennotes"
export LAUNCHER="dmenu_run"
export VIDEO_PLAYER="mpv"
. "$HOME/.local/bin/env"
