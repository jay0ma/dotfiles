#!/usr/bin/env sh

sketchybar --add item widgets.logo right \
		   --set widgets.logo icon=ﰪ \
		   					  label.drawing=off \
		   					  background.color=$C2 \
		   					  background.padding_right=3 \
		   					  icon.padding_left=13 \
		   					  icon.padding_right=10 \
		   					  click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
		   					  script="$PLUGIN_DIR/widgets.sh" \
		   					  popup.align=right \
		   --subscribe widgets.logo mouse.entered mouse.exited.global \
		   --add item widgets.volume popup.widgets.logo \
		   --set widgets.volume script="$PLUGIN_DIR/wvolume.sh" \
		   						icon.color=$GREY \
		   						background.padding_right=5 \
		   --subscribe widgets.volume mouse.clicked volume_change \
		   --add slider widgets.svolume popup.widgets.logo \
		   --set widgets.svolume slider.highlight_color=$C1 \
		   						 slider.knob=􀀁 \
		   						 slider.background.height=5 \
		   						 slider.background.corner_radius=3 \
		   						 slider.background.color=$GREY \
		   						 padding_left=0 \
		   						 padding_right=60 \
		   						 slider.width=100 \
		   						 script="$PLUGIN_DIR/wsvolume.sh" \
		   --subscribe widgets.svolume mouse.clicked
