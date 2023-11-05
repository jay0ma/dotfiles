#!/usr/bin/env sh
. ~/.config/dmenu/config.sh

# list options
ywall=$(printf \
         "Yes\\
No\\
"\
| sed 's/\\//' | ${DMENU} "Use custom wallpaper?")

choice=$(printf \
         "Tokyo_Night\\
Dark_Night\\
GruvBox_Hard\\
Dark_Pywal\\
Dark_Pywal_Laptop\\
Catpuccin_Dark\\
Default_Theme\\
"\
| sed 's/\\//' | ${DMENU} "Select theme:") # pipe options into dmenu
# if choice is empty, DO NOT PROCEED
if [ -z $choice ]; then
    exit
else # if choice is not empty, do the following:
	  sketchybar --animate sin 30 --bar y_offset=-50
    rm -rf ~/.config/sketchybar
  
    if [ "$ywall" == "Yes" ]; then 
      cat $HOME/.config/themes/${choice}/crntwall | xargs wal -i
    else
      wal -i $HOME/.config/themes/${choice}/wall.jpg
    fi

    ~/.config/yabai/yabairc
    cd ~/.config/themes/${choice} && rm -r $(echo "$HOME/.config/"$(/bin/ls | tr '\n' ' ') | sed -e 's/ / \/Users\/jerrardpang\/.config\//g')
    if [ "$choice" == "Stock" ]; then 
      osascript -e "tell application \"System Events\"
        tell dock preferences
          set autohide menu bar to false
        end tell
      end tell"
    else
      osascript -e "tell application \"System Events\"
        tell dock preferences
          set autohide menu bar to true
        end tell
      end tell"
    fi
    if [ "$choice" == "Tokyo_Night" ]; then
    	cp -r ~/.config/themes/default/* ~/.config/	
      cp -r ~/.config/themes/Default/* ~/.config/ 
    elif [ "$choice" == "Dark_Night" ]; then
    	cp -r ~/.config/themes/Dark_Night/* ~/.config/
      # wal -i ~/wallpapers/Landscape\ Wallpaper\ 1.jpg
    elif [ "$choice" == "GruvBox_Hard" ]; then
      cp -r ~/.config/themes/GruvBox_Hard/* ~/.config/
      # wal -i ~/wallpapers/GruvBox\ 1.png
    elif [ "$choice" == "Dark_Pywal" ]; then
    	cp -r ~/.config/themes/Dark_Pywal/* ~/.config/
      cp -r ~/.config/themes/Default/* ~/.config/
    	# wal --backend schemer2 -i ~/wallpapers/Silver\ Wolf\ Wallpaper.png
	  elif [ "$choice" == "Dark_Pywal_Laptop" ]; then
    	cp -r ~/.config/themes/Dark_Pywal_Laptop/* ~/.config/
      cp -r ~/.config/themes/Default/* ~/.config/
    	# wal -i ~/wallpapers/Landscape\ Wallpaper\ 5.png
    elif [ "$choice" == "Catpuccin_Dark" ]; then
    	cp -r ~/.config/themes/Catpuccin_Dark/* ~/.config/
    	# wal -i ~/wallpapers/Catpuccin\ 1.jpg
    elif [ "$choice" == "Default_Theme" ]; then
    	cp -r ~/.config/themes/Default-theme/* ~/.config/
      cp -r ~/.config/themes/Default/* ~/.config/
    	# wal -i ~/wallpapers/Blue\ Wallpaper\ 1.jpg
    	wal -f rose-pine-dawn -l
    fi
    echo $choice > ~/.config/themes/current
    sleep 5
    sketchybar --reload
    ~/.config/yabai/yabairc
fi
