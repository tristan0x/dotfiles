#!/bin/sh

if [ -f ~/.login ] ; then
    . ~/.login
fi

# Locate window manager
if type awesome >/dev/null 2>&1 ; then
    AWESOMEWM=`type awesome | awk '{print $NF;}'`
else
    for dir in /data.2/$USER/root/bin ; do
        if [ -f "$dir/awesome" ] ;then
            export AWESOMEWM="$dir/awesome"
        fi
    done
fi

# Look for session locker
if type gnome-screensaver-command >/dev/null 2>&1 ; then
    export XSCREENSAVER=gnome-screensaver-command
elif type xscreensaver-command >/dev/null 2>&1 ; then
    export XSCREENSAVER=xscreensaver
    xscreensaver -nosplash &
fi

if type gnome-keyring-daemon >/dev/null 2>&1 ; then
    eval `gnome-keyring-daemon`
    export GNOME_KEYRING_CONTROL
    export SSH_AUTH_SOCK
    export GPG_AGENT_INFO
    export GNOME_KEYRING_PID
elif type ssh-agent >/dev/null 2>&1 ; then
    eval `ssh-agent`
fi

gnome-volume-control-applet &
nm-applet &
exec ${AWESOMEWM:-awesome}
