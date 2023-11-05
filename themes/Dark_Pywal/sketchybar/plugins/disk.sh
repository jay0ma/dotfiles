sketchybar --set $NAME label=$(df -lh | grep /dev/disk3s1 | awk '{print $5}')
