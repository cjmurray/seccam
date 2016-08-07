#!/bin/bash

# find /home/camera/pics/* -name *.jpg -mtime +30 -exec rm {} \;
find /home/camera/pics/* -type d -mtime +30 -exec rm -rf {} \;
echo "$(date): rm30days executed" >> /home/camera/log/rm30days.log
