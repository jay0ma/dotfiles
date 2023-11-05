#!/usr/bin/env sh

sketchybar  --add   item spotify left \
            --set   spotify \
                        icon= \
                    	icon.font="$FONT:Bold:20.0" \
                    	icon.y_offset=1 \
                        label.drawing=off \
                    	label.padding_left=2 \
                    	label.color=$GREY \
                        script="$PLUGIN_DIR/spotify.sh" \
            --subscribe spotify spotify_change mouse.clicked
