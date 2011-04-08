#!/bin/sh

if [ -f ~/.login ] ; then
    . ~/.login
fi

if type gnome-keyring-daemon >/dev/null 2>&1 ;
    eval `gnome-keyring-daemon`
    export GNOME_KEYRING_CONTROL
    export SSH_AUTH_SOCK
    export GPG_AGENT_INFO
    export GNOME_KEYRING_PID
fi

gnome-volume-control-applet &
xscreensaver -nosplash &
nm-applet &
exec ${AWESOMEWM:-awesome}
