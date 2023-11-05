#!/usr/bin/env sh

SPACE_ICONS=("" "" "" "" "" "" "7" "8" "9" "10" "11" "12" "13" "14" "15")

# Destroy space on right click, focus space on left click.

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid center                             \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=10                          \
                              icon.padding_right=15                         \
                              background.padding_left=2                     \
                              background.padding_right=2                    \
                              label.padding_right=20                        \
                              label.color=$PURPLE							\
                              icon.color=$LBLUE								\
                              icon.highlight_color=$DBLUE	                \
                              icon.y_offset=1 								\
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.drawing=off                             \
                              script="$PLUGIN_DIR/space.sh"                 \
            --subscribe       space.$sid mouse.clicked
done

sketchybar --add bracket spaces '/space\..*/'                  \
           --set spaces  background.color=0xffffffff           \
                         background.border_color=0xffffffff    \
                         background.border_width=3             \
                         background.drawing=on
