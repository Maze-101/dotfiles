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
alias pi='doas pacman -S'
alias pu='doas pacman -Syu'
alias pr='doas pacman -Rns'
alias yi='yay -S'
alias yu='yay -Syu'
alias yr='yay -Rns'
alias cdo='flatpak run com.visualstudio.code ~/dotfiles'
alias c='flatpak run com.visualstudio.code'

######## yt-dlp ########
alias pl='yt-dlp -f "bv*[height<=720]+ba/b[height<=720]" -o "%(playlist)s/%(playlist_index)02d - %(title)s.%(ext)s"'
alias v='yt-dlp -S "res:720" --embed-chapters -o "%(title)s.%(ext)s"'
