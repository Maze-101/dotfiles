if status is-interactive
    alias ff='fastfetch'
    alias c='code'
    alias gc='git commit'
    alias p='poweroff'
    alias r='sudo reboot now'
    alias s='sudo pacman -S'
    alias up='sudo pacman -Syu'
    alias lang='setxkbmap -layout us,ara -option grp:alt_shift_toggle'
    alias tt='tt -showwpm -n 25'
    alias cdwm='code ~/Dotfiles/suckless/'
    alias mdwm='cd ~; ./Dotfiles/install.sh; cd -'
end

fastfetch
starship init fish | source
