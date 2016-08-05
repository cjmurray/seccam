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

mkdir -p orig

for FILE in `ls *.jpg | grep -v "^ts_"`; do
	UNIXTIME=`stat --format "%Y" $FILE`;
	TIMESTAMP=`date +"%F %T" -d @$UNIXTIME`;
	echo $FILE;
	convert $FILE -gravity SouthEast -pointsize 14 -fill white -undercolor '#00000080' -annotate +10+10 "$TIMESTAMP" ts_$FILE;
	mv $FILE orig
done;
