#!/usr/bin/fish

export _JAVA_AWT_WM_NONREPARENTING=1

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

# Gives gnome-keyring information about X11 environment
dbus-update-activation-environment --all

autorandr -c
feh --bg-scale ~/wallpaper.jpg
dwm-status ~/.config/dwm-status.toml &
udiskie -t &
dunst &
tapper &
xscreensaver -no-splash &
alacritty &
pause-notifications.sh &

xrdb ~/.Xresources
xset r rate 250 30

# Automatically change monitor configuration when change in outputs is detected
srandrd ~/bin/monitor-change-hook

exec dwm

