#!/usr/bin/env sh

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
sketchybar --add event spotify_change $SPOTIFY_EVENT \
		   --add item spotify_prev left \
		   --set spotify_prev icon="􀊎" \
		   					  label.drawing=off \
		   					  icon.padding_left=15 \
		   					  icon.padding_right=15 \
		   					  background.drawing=off \
		   					  icon.y_offset=1 \
		   					  icon.font="$FONT:Bold:15.0" \
		   					  script="$PLUGIN_DIR/spotify_c.sh" \
		   --subscribe spotify_prev spotify_change mouse.clicked \
		   --add item spotify_play left \
		   --set spotify_play icon="􀊄" \
		   					  label.drawing=off \
		   					  icon.padding_left=15 \
		   					  icon.padding_right=15 \
		   					  background.drawing=off \
		   					  icon.y_offset=1 \
		   					  icon.font="$FONT:Bold:20.0" \
		   					  script="$PLUGIN_DIR/spotify_c.sh" \
		   --subscribe spotify_play spotify_change mouse.clicked \
		   --add item spotify_next left \
		   --set spotify_next icon="􀊐" \
		   					  label.drawing=off \
		   					  icon.padding_left=15 \
		   					  icon.padding_right=15 \
		   					  background.drawing=off \
		   					  icon.y_offset=1 \
		   					  icon.font="$FONT:Bold:15.0" \
		   					  script="$PLUGIN_DIR/spotify_c.sh" \
		   --subscribe spotify_next spotify_change mouse.clicked 
