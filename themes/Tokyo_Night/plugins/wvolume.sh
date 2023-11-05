#!/usr/bin/env sh

sketchybar --set widgets.svolume slider.percentage=$INFO

if [[ $INFO -eq 0 ]]; then
	ICON="ﱝ"
else	
	case $INFO in
	  100) ICON="";;
	  9[0-9]) ICON="";;
	  8[0-9]) ICON="";;
	  7[0-9]) ICON="";;
	  6[0-9]) ICON="􀊧";;
	  5[0-9]) ICON="􀊧";;
	  4[0-9]) ICON="􀊧";;
	  3[0-9]) ICON="";;
	  2[0-9]) ICON="";;
	  1[0-9]) ICON="";;
	  [0-9]) ICON="";;
	  *) ICON=""
	esac
fi

sketchybar --set $NAME icon=$ICON
