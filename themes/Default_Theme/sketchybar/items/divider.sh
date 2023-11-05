#!/usr/bin/env sh

sketchybar --add item divider left \
		   --set divider icon="|" \
		   				 label.drawing=off \
		   				 icon.font="SF Pro Rounded:Black:20.0" \
		   				 icon.padding_left=0 \
		   				 icon.padding_right=14 \
		   				 icon.y_offset=2 \
		   				 script="$PLUGIN_DIR/divider.sh" \
		   --subscribe divider mouse.clicked
