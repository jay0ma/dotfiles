#!/usr/bin/env sh

sketchybar 	  --add item apple.logo left                                                      \
              --set apple.logo icon=􀣺                                                         \
                               icon.font="$FONT:Heavy:16.0"                                   \
                               icon.padding_left=10											  \
                               icon.padding_right=10										  \
                               label.drawing=off                                              \
                               background.color=$DBLUE										  \
                               background.height=22											  \
                               background.padding_left=3									  \
                               background.padding_right=0									  \
                               click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
                               script="$PLUGIN_DIR/apple.sh"								  \
              --subscribe apple.logo mouse.entered mouse.exited.global						  \
              --add item apple.preferences popup.apple.logo                                   \
              --set apple.preferences icon=􀺽                                                  \
							   icon.padding_right=5											  \
							   icon.color=$GREY												  \
                               label="Preferences"                                            \
                               label.color=$GREY											  \
                               background.padding_right=14									  \
                               click_script="open -a 'System Preferences';                    
                                             sketchybar -m --set apple.logo popup.drawing=off"\
              --add item apple.activity popup.apple.logo                                      \
              --set apple.activity icon=􀒓                                                     \
							   icon.padding_right=5											  \
							   icon.color=$GREY												  \
                               label="Activity"                                               \
                               label.color=$GREY											  \
                               click_script="open -a 'Activity Monitor';                       
                                             sketchybar -m --set apple.logo popup.drawing=off"\
              --add item apple.lock popup.apple.logo                                          \
              --set apple.lock icon=􀒳                                                         \
							   icon.padding_right=5											  \
							   icon.color=$GREY												  \
                               label="Lock Screen"                                            \
                               label.color=$GREY											  \
                               click_script="pmset displaysleepnow;                           
                                             sketchybar -m --set apple.logo popup.drawing=off"
