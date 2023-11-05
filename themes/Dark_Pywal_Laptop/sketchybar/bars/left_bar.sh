source "$ITEM_DIR/apple.sh"
source "$ITEM_DIR/clipboard.sh"
source "$ITEM_DIR/front_app.sh"
# source "$ITEM_DIR/cpu.sh"
# source "$ITEM_DIR/ram.sh"
# source "$ITEM_DIR/disk.sh"
source "$ITEM_DIR/spaces.sh"

sketchybar --add bracket left_bar apple.logo \
								  clipboard 

sketchybar --add bracket system cpu \
								ram \
								disk 
