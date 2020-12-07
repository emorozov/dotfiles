#!/bin/bash

export PATH="$HOME/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1

eval $(ssh-agent)

feh --bg-scale ~/wallpaper.jpg
slstatus &
udiskie -t &
dunst &

xset dpms 3000 4800 4800
xset s 2700
xss-lock slock &

xrdb ~/.Xresources

(while true; do notify-send -u low "  Do some exercise  "; sleep $(( 60 * (20 + $RANDOM % 40) )); done) &

exec dwm

