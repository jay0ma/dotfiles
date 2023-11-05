#!/usr/bin/env sh

# Pywal integration

. "${HOME}/.cache/wal/colors.sh"

CBACK=0xff$(echo $background | sed 's/#//')
CFORE=0xff$(echo $foreground | sed 's/#//')
CINSE=$CFORE
CCUR=0xff$(echo $cursor | sed 's/#//')
C1=0xff$(echo $color1 | sed 's/#//')
C2=0xff$(echo $color2 | sed 's/#//')
C3=0xff$(echo $color3 | sed 's/#//')
C4=0xff$(echo $color4 | sed 's/#//')
C5=0xff$(echo $color5 | sed 's/#//')
C6=0xff$(echo $color6 | sed 's/#//')
C7=0xff$(echo $color7 | sed 's/#//')
C8=0xff$(echo $color8 | sed 's/#//')
C0=0xff$(echo $color0 | sed 's/#//')


# All the colors

BAR_COLOR=$CBACK
ICON_COLOR=0xffffffff
LABEL_COLOR=0xffffffff
BG_COLOR=0xff1d344f
GREY=0xff989898
WHITE=0xffffffff
PINK=0xffc08093
GREEN=0xff7ca198
YELLOW=0xffe4b371
DBLUE=0xff6080b0
PURPLE=0xff8e6f98
LBLUE=0xff6ca8cf
