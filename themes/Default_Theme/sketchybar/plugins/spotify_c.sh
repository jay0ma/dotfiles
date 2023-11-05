#!/usr/bin/env sh

SPOTIFY_JSON="$INFO"

prev() {
	osascript -e 'tell application "Spotify" to play previous track'
}

play() {
	osascript -e 'tell application "Spotify" to playpause'
}

next() {
	osascript -e 'tell application "Spotify" to play next track'
}

name() {
	case "$NAME" in
	  "spotify_prev") prev
	  ;;
	  "spotify_play") play
	  ;;
	  "spotify_next") next
	  ;;
	esac
}

update() {
	if [ $PLAYER_STATE = "Playing" ]; then
		sketchybar --set $NAME icon="􀊆"
	elif [ $PLAYER_STATE = "Paused" ]; then
		sketchybar --set $NAME icon="􀊄"
	fi
}

name_u() {
	PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
	if [ "$NAME" = "spotify_play" ]; then
		  update
	fi
	echo $PLAYER_STATE
	if [ $PLAYER_STATE = "Playing" ]; then
		sketchybar --set $NAME icon.drawing=on 
		sketchybar --animate tanh 30 --set $NAME width=30
	elif [ $PLAYER_STATE = "Paused" ]; then
		sketchybar --set $NAME icon.drawing=on 
		sketchybar --animate tanh 30 --set $NAME width=30
	elif [ $PLAYER_STATE = "Stopped" ]; then
		sketchybar --animate tanh 30 --set $NAME width=0
		sketchybar --set $NAME icon.drawing=off 
	fi
}

case "$SENDER" in
  "mouse.clicked") name
  ;;
  *) name_u
  ;;
esac
