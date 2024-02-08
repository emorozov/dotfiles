#!/usr/bin/env fish

set CONTAINER (docker ps | tail -n +2 | rofi -dmenu -p 'Select Container' | cut -d ' ' -f 1)


if not set -q CONTAINER
  echo 'Cancel'
else
  rofi-sensible-terminal -e docker exec -ti "$CONTAINER" /bin/bash
end
