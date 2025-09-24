#!/bin/sh

dbus-run-session -- sh -c "
    # Background services
    slstatus &
    # xautolock -time 5 -locker 'slock' &
    # Autostart apps
    ~/.config/auto/x11autostart.sh &
    # Finally start dwm
    exec dwm
"
