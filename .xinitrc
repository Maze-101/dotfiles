setxkbmap -layout us,ara -option grp:alt_shift_toggle
xsetroot -solid "#1b1b1b"
dwmblocks &
sxhkd &
export XDG_CURRENT_DESKTOP=dwm
if systemctl --user id >/dev/null 2>&1; then
    systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP
    systemctl --user restart xdg-desktop-portal
    systemctl --user restart xdg-desktop-portal-gtk
fi
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
dwm

