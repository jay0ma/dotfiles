sketchybar --add item sound right \
           --set sound script="$PLUGIN_DIR/sound.sh" \
           			   background.color=$PINK \
           			   background.height=22 \
           			   background.padding_left=3 \
           			   icon.padding_left=5 \
           --subscribe sound mouse.entered mouse.exited volume_change \
           --add item headphones popup.sound \
           --set headphones label.color=$GREY \
           					icon.color=$GREY \
           					icon.y_offset=1 \
           					background.padding_right=30
