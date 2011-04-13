#!/bin/sh

if [ -f ~/.login ] ; then
    . ~/.login
fi

# return 0 if executable $1 is running, something else otherwise
is_executable_running() {
    ps -A | awk '{print $NF;}' | grep -q "^$1"
}

run_once() {
    is_executable_running $1 || $@
}

# Look for screen locker
for s in gnome-screensaver xscreensaver ; do
    if type "$s" >/dev/null 2>&1 ; then
	# command to execute to lock screen
	export SCREENSAVER_LOCK_CMD="$s-command --lock"
	# start daemon if not already running.
	run_once "$s" || "$s" &
	break
    fi
done

if type gnome-keyring-daemon >/dev/null 2>&1 ; then
    eval `gnome-keyring-daemon`
    export GNOME_KEYRING_CONTROL
    export SSH_AUTH_SOCK
    export GPG_AGENT_INFO
    export GNOME_KEYRING_PID
elif type ssh-agent >/dev/null 2>&1 ; then
    eval `ssh-agent`
fi

run_once gnome-volume-control-applet &
run_once nm-applet &

xset s off
xset b off
xset m 6 2
resources=$HOME/.config/awesome/xresources
if [ -f "$resources" ] ;then
    xrdb -merge "$resources"
fi


# Locate window manager
if type awesome >/dev/null 2>&1 ; then
    export AWESOMEWM=`type awesome | awk '{print $NF;}'`
else
    for dir in /data.2/$USER/root/bin ; do
        if [ -f "$dir/awesome" ] ;then
            export AWESOMEWM="$dir/awesome"
        fi
    done
fi
echo $SCREENSAVER_LOCK_CMD
exec ${AWESOMEWM}
