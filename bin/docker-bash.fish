#!/usr/bin/env fish

set CONTAINER (docker ps | tail -n +2 | rofi -dmenu -p 'Select Container' | cut -d ' ' -f 1)


if test -n "$CONTAINER"
    rofi-sensible-terminal -e docker exec -ti "$CONTAINER" /bin/bash
end
