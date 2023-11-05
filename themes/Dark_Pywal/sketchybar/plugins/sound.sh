#!/usr/bin/env sh

update() {
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

	# DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].device_connected[] | select ( .[] | .device_minorType == "Headset")' | jq '.[]')
	DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headset") | keys[]' | jq -r)
	
	if [ "$DEVICES" != "" ]; then
		  PICON="􀑈"
		  PLABEL="$DEVICES"
	else
		PICON="ﳌ"
		PLABEL="Not connected"
	fi
	
	sketchybar -m \
	--set $NAME icon=$ICON \
	--set $NAME label="$INFO%"

	sketchybar -m \
		--set headphones icon=$PICON \
		--set headphones label="$PLABEL"
}

case "$SENDER" in
	"volume_change") update
	;;
	"mouse.entered") sketchybar --set $NAME popup.drawing=on
	;;
	"mouse.exited") sketchybar --set $NAME popup.drawing=off
	;;
esac
