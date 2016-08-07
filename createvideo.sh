#!/bin/bash
PIX_HOME=/home/camera/pics
VIDEO=/home/camera/video

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

# ffmpeg -r 10 -pattern_type glob -i 'frontdoor_*.jpg' -vcodec mjpeg -n frontdoor_$DATE.mov
# ffmpeg -r 10 -pattern_type glob -i 'frontwindow_*.jpg' -vcodec mjpeg -n frontwindow_$DATE.mov

ffmpeg -r 10 -pattern_type glob -i 'ts_frontdoor_*.jpg' -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.2 -crf 25 $VIDEO/frontdoor_$DATE.mp4
ffmpeg -r 10 -pattern_type glob -i 'ts_frontwindow_*.jpg' -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.2 -crf 25 $VIDEO/frontwindow_$DATE.mp4  
ffmpeg -r 10 -pattern_type glob -i 'ts_garage_*.jpg' -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.2 -crf 25 $VIDEO/garage_$DATE.mp4  


echo "$(date): createvideo executed" >> /home/camera/log/createvideo.log
# ffmpeg -i frontwindow_20160804.mov -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.2 -crf 25 frontwindow_20160804.mp4
