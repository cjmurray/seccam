#!/bin/bash

# find /home/camera/pics/* -name *.jpg -mtime +30 -exec rm {} \;
find /home/camera/pics/* -type d -maxdepth 1 -mtime +30 -exec rm -rf {} \;
find /home/camera/video/* -mtime +21 -exec rm -rf {} \;
find /home/camera/sync/* -mtime +14 -exec rm -rf {} \;
echo "$(date): rm30days executed" >> /home/camera/log/rm30days.log
