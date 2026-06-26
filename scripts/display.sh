#!/bin/bash

systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP
systemctl --user restart xdg-desktop-portal
systemctl --user restart xdg-desktop-portal-gtk
