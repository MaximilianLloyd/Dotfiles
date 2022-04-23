#!/bin/bash

bspc wm -r

~/.screenlayout/workv2.sh

bspc monitor DP-1-2 -d I II III IV V 
bspc monitor DP-1-1 -d VI VII VIII IX X 

polybar dell &
polybar asus &
