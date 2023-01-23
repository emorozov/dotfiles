#!/usr/bin/fish

export _JAVA_AWT_WM_NONREPARENTING=1

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

autorandr -c
picom --backend glx --vsync --no-use-damage --experimental-backends -b
feh --bg-scale ~/wallpaper.jpg
dwm-status ~/.config/dwm-status.toml &
udiskie -t &
dunst &
tapper &
xscreensaver -no-splash &
alacritty &

xrdb ~/.Xresources

# Automatically change monitor configuration when change in outputs is detected
srandrd ~/bin/monitor-change-hook

exec dwm

