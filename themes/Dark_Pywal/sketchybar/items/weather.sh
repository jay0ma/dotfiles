#!/usr/bin/env sh

sketchybar --add item weather right \
    	   --set weather \
        		 update_freq=30 \
        		 script="$PLUGIN_DIR/weather.sh" \
        		 background.color=$C2 \
        		 background.drawing=on \
           --subscribe weather mouse.entered mouse.exited \
           --add item weather.info popup.weather \
           --set weather.info icon.color=$GREY \
           					  label.color=$GREY \
           					  background.padding_right=30
