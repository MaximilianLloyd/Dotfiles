#!/bin/bash
while inotifywait -e close_write /home/max/Dropbox; do /home/max/scripts/dropbox.sh; done
