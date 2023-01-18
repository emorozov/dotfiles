#!/usr/bin/fish

export _JAVA_AWT_WM_NONREPARENTING=1

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

xrandr --listmonitors | grep -F HDMI && xrandr --output eDP1 --off
picom --backend glx --vsync --no-use-damage --experimental-backends -b
feh --bg-scale ~/wallpaper.jpg
dwm-status ~/.config/dwm-status.toml &
udiskie -t &
dunst &
tapper &
xscreensaver -no-splash &
alacritty &

xrdb ~/.Xresources

exec dwm

