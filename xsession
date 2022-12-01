#!/bin/bash

export PATH="$HOME/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1

eval $(ssh-agent)

xrandr --listmonitors | grep -F HDMI && xrandr --output eDP1 --off
picom -b
feh --bg-scale ~/wallpaper.jpg
dwm-status ~/dotfiles/dwm-status.toml &
udiskie -t &
dunst &

xrdb ~/.Xresources

exec dwm

