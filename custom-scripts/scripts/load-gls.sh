#!/bin/bash

# sxhkd &
bspc wm -r

~/.screenlayout/jacob.sh

bspc monitor DP-1 -d I II III IV V VI VII VIII IX X

# Kill all
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

feh --bg-scale ~/backgrounds/worlds.jpg
polybar lg &
