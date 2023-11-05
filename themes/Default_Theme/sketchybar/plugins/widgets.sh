#!/usr/bin/env sh

case "$SENDER" in
  "mouse.entered") sketchybar --set $NAME popup.drawing=on
  ;;
  "mouse.exited.global") sketchybar --set $NAME popup.drawing=off
  ;;
esac
