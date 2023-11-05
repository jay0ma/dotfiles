#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
. "$CONFIG_DIR/globals.sh"

sb_separator() {
	sepName="sep$RANDOM"
	sketchybar \
		--add item "$sepName" "$1" \
		--set "$sepName" \
		\
		label="───────" \
		padding_left="$2" \
		padding_right="$3" \
		icon.drawing=off \
		label.font.size=9.0 \
		label.color="$OX_DIM"
}

sb_clock() {
	sketchybar \
		--add item clock "$1" \
		--set clock \
		\
		update_freq=10 \
		label.font.size=14.0 \
		icon= \
		icon.drawing=off \
		script="$PLUGIN_DIR/clock.sh"
}

sb_pomodoro() {
	sketchybar \
		--add item pomodoro "$1" \
		--set pomodoro \
		\
		update_freq=1 \
		label.font.size=14.0 \
		label.highlight_color="$OX_ORG" \
		label.highlight=off \
		icon= \
		icon.drawing=off \
		updates="when_shown" \
		drawing=off \
		script="$PLUGIN_DIR/pomodoro.sh"
}

sb_date() {
	sketchybar \
		--add item day "$1" --set day update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%a')" \
		--add item date "$1" --set date update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%d' | sed s/^0//)" \
		--add item month "$1" --set month update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%b')"
}

sb_spaces() {
	for i in "${!SPACE_ICONS[@]}"; do
		sid=$((i + 1))

		sketchybar \
			--add space space.$sid "$1" \
			--subscribe space.$sid window_change \
			--set space.$sid \
			\
			associated_space=$sid \
			icon="$i" \
			icon="${SPACE_ICONS[i]}" \
			icon.font.size=14 \
			label="·" \
			label.drawing=off \
			script="$PLUGIN_DIR/space.sh" \
			click_script="yabai -m space --focus $sid"

		if [[ $sid == 5 ]]; then sb_separator left 14 14; fi
	done
}

sb_wifi() {
	sketchybar \
		--add item wifi "$1" \
		--subscribe wifi wifi_change \
		--set wifi \
		\
		script="$PLUGIN_DIR/wifi.sh" \
		icon=􀙇 \
		label.color=$OX_DIM
}

sb_battery() {
	sketchybar \
		--add item battery "$1" \
		--subscribe battery system_woke power_source_change \
		--set battery \
		\
		script="$PLUGIN_DIR/battery.sh" \
		update_freq=120 \
		label.color=$OX_DIM
}

sb_volume() {
	sketchybar \
		--add item volume "$1" \
		--subscribe volume volume_change \
		--set volume \
		\
		script="$PLUGIN_DIR/volume.sh" \
		label.color=$OX_DIM
}
