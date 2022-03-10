#!/bin/bash

bspc wm -r

~/.screenlayout/workv2.sh

bspc monitor DP-1-2 -d I II III IV V 
bspc monitor DP-1-1 -d VI VII VIII IX X 

# bspc monitor DP-1-1 -s DP-1-2

# Kill all
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

feh --bg-scale ~/backgrounds/porter.jpg

polybar dell &
polybar asus &
