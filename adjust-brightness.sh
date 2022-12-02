#!/bin/sh
# usage:
# ln -s adjust-brightness.sh day.sh
# ln -s adjust-brightness.sh night.sh
what=$(basename "$0")
if [ "$what" == "night.sh" ] ; then
	echo "night"
	BRI="0.8"
	GAMMA="1.0:0.7:0.6"
elif [ "$what" == "day.sh" ] ; then
	echo "day"
	BRI="1.0"
	GAMMA="1.0:1:1"
else
	echo "Usage: (night.sh|day.sh)"
	exit 1
fi

for disp in $(xrandr  |grep '\<connected\>' | cut -f 1 -d ' ') ; do 
	xrandr --output $disp --brightness "$BRI" --gamma "$GAMMA"
done
