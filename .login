export SHELL=/usr/bin/zsh

if type awesome >/dev/null 2>&1 ; then
    AWESOMEWM=`type awesome | awk '{print $NF;}'`
else
    for dir in /data.2/$USER/root/bin ; do
        if [ -f "$dir/awesome" ] ;then
            export AWESOMEWM="$dir/awesome"
        fi
    done
fi

for p in gnome-screensaver-command xscreensaver-command; do
    if type "$p" >/dev/null 2>&1; then
        export XSCREENSAVER="$p"
        break
    fi
done

