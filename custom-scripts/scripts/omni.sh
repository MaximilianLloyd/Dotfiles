#!/bin/bash

# sxhkd &
bspc wm -r
~/.screenlayout/omni.sh

bspc monitor DisplayPort-2 -d I II III IV V VI VII VIII IX X

# Kill all
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

feh --bg-scale ~/backgrounds/vroom.jpg
polybar omni &
