source "$ITEM_DIR/search.sh"
source "$ITEM_DIR/time.sh"
source "$ITEM_DIR/date.sh"
source "$ITEM_DIR/input.sh"
source "$ITEM_DIR/battery.sh"
source "$ITEM_DIR/weather.sh"
source "$ITEM_DIR/sound.sh"

sketchybar --add bracket right_bar widgets.logo \
								   time \
								   date \
								   input \
								   battery \
								   weather \
								   sound 
