#!/bin/sh

window_state() {
  source "$HOME/.config/sketchybar/colors.sh"
  source "$HOME/.config/sketchybar/icons.sh"

  WINDOW=$(yabai -m query --windows --window)
  CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  if [[ $CURRENT -gt 0 ]]; then
    LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    args+=(--set $NAME icon=$YABAI_STACK icon.color=$WHITE label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))

  else 
    args+=(--set $NAME label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.color=$DBLUE)
        elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.color=$BG_COLOR)
        else
          args+=(--set $NAME icon=$YABAI_GRID icon.color=$YELLOW)        
        fi
        ;;
      "true")
        args+=(--set $NAME icon=$YABAI_FLOAT icon.color=$PURPLE)
        ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  window_state
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit 0
  ;;
  "window_focus") window_state 
  ;;
esac
