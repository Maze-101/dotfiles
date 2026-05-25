if status is-interactive
    alias f='fastfetch'
    alias c='code'
    alias gc='git commit'
    alias p='poweroff'
    alias r='sudo reboot now'
    alias s='sudo pacman -S'
    alias up='sudo pacman -Syu'
    alias lang='setxkbmap -layout us,ara -option grp:alt_shift_toggle'
    alias tt='tt -showwpm -n 25'
    alias cdwm='code ~/Dotfiles/suckless/'
    alias mdwm='cd ~/Dotfiles/suckless/dwm; sudo make clean install; cd ~'
    alias mst='cd ~/Dotfiles/suckless/st; sudo make clean install; cd ~'
    alias mdmenu='cd ~/Dotfiles/suckless/dmenu; sudo make clean install; cd ~'
end

starship init fish | source
