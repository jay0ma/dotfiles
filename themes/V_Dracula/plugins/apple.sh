#!/usr/bin/env sh

entered() {
	sketchybar --animate tanh 30 --set clipboard width=10
	sketchybar --set clipboard drawing=on
}

exited() {
	sketchybar --animate tanh 30 --set clipboard width=0 
	sketchybar --set clipboard drawing=off
}

case "$SENDER" in
  "mouse.entered") entered
  ;;
  "mouse.exited.global") exited
  ;;
esac
