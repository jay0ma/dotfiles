#!/usr/bin/env sh

update() {
  args=()
  if [ "$NAME" != "space_template" ]; then
    args+=(--set $NAME label=$NAME \
                       icon.highlight=$SELECTED)
  fi
  
  if [ "$SELECTED" = "true" ]; then
  	DID=$(( $DID + 1 ))
    args+=(--set space.$DID label=${NAME#"space.$DID."})
    args+=(--set $NAME icon.background.y_offset=-12)
  else
    args+=(--set $NAME icon.background.y_offset=-20)
  fi
  
  sketchybar -m --animate tanh 20 "${args[@]}"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
