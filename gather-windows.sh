#!/bin/bash
x=30
y=45
for window_id in $(wmctrl -l -x -G | grep -vi desktop | cut -f 1 -d ' ') ; do 
	wmctrl -i -r "$window_id" -e 0,$x,$y,-1,-1
	x=$((x+20))
	y=$((y+20))
done
