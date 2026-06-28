#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export JAVA_HOME="/home/shikigami/jdk/jdk-26.0.1/"
export XDG_CURRENT_DESKTOP=dwm
export PATH="$JAVA_HOME/bin:$HOME/dotfiles/scripts:$PATH"

bind '"\x08": backward-kill-word'
eval "$(starship init bash)"

alias ff='fastfetch'

######## system ########
alias u='doas pacman -Syu && yay -Syu'

######## yt-dlp ########
alias pl='yt-dlp -f "bv*[height<=720]+ba/b[height<=720]" -o "%(playlist)s/%(playlist_index)02d - %(title)s.%(ext)s"'
alias v='yt-dlp -S "res:720" --embed-chapters -o "%(title)s.%(ext)s"'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

. "$HOME/.local/bin/env"
