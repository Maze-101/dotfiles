#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/bin:$PATH"

bind '"\x08": backward-kill-word'
eval "$(starship init bash)"

alias ff='fastfetch'

######## system ########
alias u='doas pacman -Syu && yay -Syu'
alias pi='doas pacman -S'
alias pr='doas pacman -Rns'
alias yi='yay -S'
alias yr='yay -Rns'
alias vdo='nvim ~/dotfiles'

######## yt-dlp ########
alias pl='yt-dlp -f "bv*[height<=720]+ba/b[height<=720]" -o "%(playlist)s/%(playlist_index)02d - %(title)s.%(ext)s"'
alias v='yt-dlp -S "res:720" --embed-chapters -o "%(title)s.%(ext)s"'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
