#!/bin/bash

export PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
export OX_BG="0xff24202c"
export OX_FG="0xfff4cde9"
export OX_DIM="0xff6f5a71"
export OX_MG="0xffad7fa8"
export OX_ORG="0xfff99286"
export SPACE_ICONS=("􀊴" "􀌃" "􀨁" "􀢅" "􀰬" "􀧶" "􁸅" "􀟆" "􁷯")

export SB_BAR=(
  position=left
  height=60
  sticky=on
  topmost=on
  shadow=on
  y_offset=10
  margin=10
  padding_left=16
  padding_right=16
  color="$OX_BG"
  border_color="$OX_DIM"
  border_width=1
  corner_radius=10
  font_smoothing=on
)

export SB_DEFAULT=(
  icon.font.family="SF Pro"
  icon.font.style="Regular"
  icon.font.size=12
  icon.color="$OX_DIM"
  label.font="Source Code Pro"
  label.font.style="Regular"
  label.font.size=13
  label.color="$OX_MG"
  padding_left=10
  padding_right=10
  icon.padding_right=4
  icon.highlight_color="$OX_MG"
)
