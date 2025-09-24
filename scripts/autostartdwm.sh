#!/bin/sh

gentoo-pipewire-launcher restart &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
# unclutter &
# ~/.fehbg &
# iwgtk -i &
blueman-applet &
mpd &
dunst ~/.config/dunst/dunstrc &
clipmenud &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/libexec/xdg-desktop-portal-gtk &
/usr/libexec/xdg-desktop-portal &
emacs --daemon &
#xsetroot -solid '#5e81ac' &
#xsetroot -solid '#4c566a' &
xsetroot -solid '#2F4156' &
#~/.fehbg &
~/.local/bin/battery.sh &
udiskie --appindicator --no-automount &

# MOUSE_ID=$(xinput --list --short | grep -i touchpad| cut -d "=" -f2 | cut -c 1-2)
# accel=$(xinput --list-props "$MOUSE_ID" | grep 'Accel Speed' | cut -d "(" -f2 | cut -c 1-3 | tail -2 | head -1)
# tap=$(xinput --list-props "$MOUSE_ID" | grep 'Tapping Enabled' | cut -d "(" -f2 | cut -c 1-3 | tail -2 | head -1)
# xinput --set-prop "$MOUSE_ID" "$accel" 0.8
# xinput --set-prop "$MOUSE_ID" "$tap" 1
