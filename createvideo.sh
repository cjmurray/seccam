#!/bin/bash
PIX_HOME=/home/camera/pics

if [ $# -eq 0 ] 
then
	# use yesterday's date by default
	DATE=$(date --date="yesterday" +"%Y%m%d")
	echo $DATE
else # [ $# -eq 1 ]; 
	DATE=$1
fi

DIR="$PIX_HOME/$DATE"

cd $DIR
pwd

ffmpeg -r 10 -pattern_type glob -i 'frontdoor_*.jpg' -vcodec mjpeg -n frontdoor_$DATE.mov
ffmpeg -r 10 -pattern_type glob -i 'frontwindow_*.jpg' -vcodec mjpeg -n frontwindow_$DATE.mov

echo "$(date): createvideo executed" >> createvideo.log
