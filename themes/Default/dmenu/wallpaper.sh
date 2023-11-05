#! /usr/bin/env sh

# get config
. ~/.config/dmenu/config.sh

listthemes=$(ls /Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages/pywal/colorschemes/dark/ /Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages/pywal/colorschemes/light/)

# function for choosing a spacific wallpaper
choose () {
    cd ~/wallpapers
    wall=$(sxiv -r -q -t -o *)
    # wall=$(feh -r -t)

    if [ -z "$wall" ]; then
        exit
    fi
    backend=$(printf "wal\nhaishoku\nfast_colorthief\nschemer2\ncolorz\ncolorthief" | ${DMENU} "Pick a backend for pywal to use")
    wal -i "${wall}" --backend "${backend}"
    if [ $(printf "Yes\nNo" | ${DMENU} "Use custom theme?") == "Yes" ]; then
    	ctheme=$( ${listthemes} | ${DMENU} "Pick a theme:")
    	wal -f ctheme
    fi
    echo $(cat ~/.cache/wal/wal) >> ${FOLDER}/.wallpaper_history
}

# function for choosing a random wallpaper
random () {
    export file=$(ls -R ~/Wallpapers/ | shuf -n 1)
    timeout 1s wal -i ~/wallpapers/$file
    echo $(cat ~/.cache/wal/wal) >> ${FOLDER}/.wallpaper_history
}

# funcion for applying the current wallpaper to your current rice
apply () {
    wal -i "${wall}"
    export currentwall=$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)' | sed -e 's/ /\\ /g')
    echo $currentwall > ~/.config/themes/$(cat ~/.config/themes/current)/crntwall
}

# a function to undo setting a wallpaper
undo () {
    export lastwall=$(sed 'x;$!d' < ${FOLDER}/.wallpaper_history)
    timeout 1s wal -i $lastwall
}

# a function to confirm setting the wallpaper
confirm () {
    choice=$(printf "Yes\nNo\nNo, Give me another random wallpaper" | ${DMENU} "Do you like your new wallpaper?")
    if [[ $choice == "Yes" ]]; then
      apply
    	sketchybar --reload
        exit
    fi

    if [[ $choice == "No" ]]; then
        undo
    fi

    if [[ $choice == "No, Give me another random wallpaper" ]]; then
        random
        confirm
    fi
}

# list all options
main () {
    choice=$(printf "Choose\nRandom\nApply\nUndo" | ${DMENU} "What would you like to do?")

    if [[ $choice == "Choose" ]]; then
        choose
        confirm
    fi

    if [[ $choice == "Random" ]]; then
        random
        confirm
    fi

    if [[ $choice == "Apply" ]]; then
        apply
    fi

    if [[ $choice == "Undo" ]]; then
        undo
        confirm
    fi
}

main
