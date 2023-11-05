source "$ITEM_DIR/apple.sh"
source "$ITEM_DIR/clipboard.sh"
source "$ITEM_DIR/divider.sh"
source "$ITEM_DIR/spotify_c.sh"
source "$ITEM_DIR/front_app.sh"
source "$ITEM_DIR/cpu.sh"
source "$ITEM_DIR/ram.sh"
source "$ITEM_DIR/disk.sh"
source "$ITEM_DIR/spotify.sh"

sketchybar --add bracket left_bar apple.logo \
								  clipboard \
								  divider \
								  spotify_prev \
								  spotify_play \
								  spotify_next 

sketchybar --add bracket system cpu \
								ram \
								disk 
