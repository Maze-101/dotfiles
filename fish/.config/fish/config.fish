if status is-interactive
    bind \b backward-kill-word
    ####### basic aliases #######
    alias c='code'
    alias ff='fastfetch'
    alias cdo='code ~/dotfiles/'
    alias mdwm='cd ~; ./dotfiles/scripts/make.sh; cd -'
    ########### git #############
    alias gc='git commit -m'
    alias gp='git push -u origin main'
    alias ga='git add .'
    ######### system ############
    alias p='poweroff'
    alias r='sudo reboot now'
    alias s='sudo pacman -S'
    alias up='sudo pacman -Syu'
    ####### touch typing ########
    alias tt='tt -showwpm -n 25'
    ########## yt-dlp ###########
    alias pl='yt-dlp -f "bestvideo[height<=720][fps<=60]+bestaudio/best" --embed-chapters -o "%(playlist_index)s - %(title)s.%(ext)s"'
    alias v='yt-dlp --embed-chapters'
end

starship init fish | source

##########################
#######  GLOBALS  ########
##########################  

set -gx TERMINAL "kitty"
set -gx BROWSER "brave"
set -gx NOTES "obsidian"
set -gx IDE "code"
set -gx LAUNCHER "rofi -show drun"
set -gx FILE_MANAGER "yazi"