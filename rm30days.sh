#!/bin/bash

find /home/camera/pics/* -name *.jpg -mtime +30 -exec rm {} \;
echo "$(date): rm30days executed" >> rm30days.log
