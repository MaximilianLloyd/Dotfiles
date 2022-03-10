#!/bin/bash

sxhkd &

~/.screenlayout/laptop.sh

feh --bg-scale ~/backgrounds/porter.jpg &

# autorandr load mobile

bspc wm -r
bspc monitor eDP-1 -d I II III IV V VI VII VIII IX X

# Kill all
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top &
