#!/usr/bin/env bash

# Define options matching a minimalist dwm aesthetic
options="Lock\nReboot\nPoweroff\nLog Out\n"

# Launch dmenu 
chosen=$(echo -e "$options" | dmenu -i -p "Power:" -fn "Monospace-10" -nb "#222222" -nf "#bbbbbb" -sb "#005577" -sf "#eeeeee")

case "$chosen" in
    *Lock)
        slock ;;
    *Reboot)
        doas reboot ;; 
    *poweroff)
        doas poweroff ;; 
    *Log*Out)
        killall dwm ;;
    *)
        exit 1 ;;
esac
