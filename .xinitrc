#!/bin/sh

if [ -f ~/.login ] ; then
    . ~/.login
fi

gnome-volume-control-applet &
xscreensaver -nosplash &
nm-applet &
exec ${AWESOMEWM:-awesome}
