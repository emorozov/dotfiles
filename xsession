#!/bin/bash

export PATH="$HOME/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1

eval $(ssh-agent)

feh --bg-scale ~/wallpaper.jpg
dwm-status ~/dotfiles/dwm-status.toml &
udiskie -t &
dunst &

xset dpms 3000 4800 4800

xrdb ~/.Xresources

exec dwm

