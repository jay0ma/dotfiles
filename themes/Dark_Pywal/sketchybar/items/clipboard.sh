#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add item clipboard left \
           --set clipboard script="python3 $PLUGIN_DIR/clipboard.py" \
                           updates=on \
                           update_freq=30 \
                           icon=  \
                           icon.color=0xffd3bd97 \
                           icon.padding_left=14 \
                           icon.padding_right=14 \
                           label.drawing=off \
                           drawing=off \
                           click_script="python3 $PLUGIN_DIR/clipboard.py && $POPUP_CLICK_SCRIPT" \
           --add item clipboard.template left popup.clipboard \
