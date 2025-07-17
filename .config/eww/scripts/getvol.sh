#!/bin/bash

vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
if [ "$mute" = true ]; then
    /usr/bin/eww update volico="󰖁"
    vol="0";
else
    /usr/bin/eww update volico="󰕾"
fi
/usr/bin/eww update get_vol="$vol"


pactl subscribe | stdbuf -oL grep --line-buffered "Event 'change' on sink" | while read -r _; do
    vol=$(pamixer --get-volume)
    mute=$(pamixer --get-mute)
    if [ "$mute" = true ]; then
        /usr/bin/eww update volico="󰖁"
        vol="0";
    else
        /usr/bin/eww update volico="󰕾"
    fi
    /usr/bin/eww update get_vol="$vol"
done
