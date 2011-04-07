#!/bin/sh
gnome-volume-control-applet &
xscreensaver -nosplash &
nm-applet &
exec awesome
