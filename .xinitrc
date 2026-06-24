setxkbmap -layout us,ara -option grp:alt_shift_toggle
xsetroot -solid "#1b1b1b"
dwmblocks &
sxhkd &
export XDG_CURRENT_DESKTOP=XFCE
export GTK_USE_PORTAL=1

# Tell systemd about the graphical session
systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP
# Force DBus/Systemd to pick up the portal configurations immediately
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP

dwm

