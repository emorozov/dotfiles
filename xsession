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
lxqt-policykit-agent &

autorandr -c
feh --bg-scale ~/wallpaper.jpg
dwm-status ~/.config/dwm-status.toml &
udiskie -t &
dunst &
tapper &
alacritty &

xrdb ~/.Xresources
xset r rate 210 80
xset dpms 1800 3600 7200

# Automatically change monitor configuration when change in outputs is detected
srandrd ~/bin/monitor-change-hook

exec dwm

