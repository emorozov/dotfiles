#!/bin/bash

export PATH="$HOME/bin:$PATH"

eval $(ssh-agent)

feh --bg-scale ~/wallpaper.jpg
slstatus &
udiskie -t &
dunst &
urxvtd -q -o -f
xss-lock slock &

xrdb ~/.Xresources

exec dwm

