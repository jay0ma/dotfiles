#!/usr/bin/env sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

# general
# settings that apple to all scripts
DMENU="dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i -l 20 -p" # define dmenu prompt
DMENU_APPS="dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i" # define dmenu prompt for apps.sh
FOLDER="/Users/jerrardpang/.config/dmenu" # the folder where the dmenu scripts are located

# screenshot
# settings for the screenshot script
SCREENSHOTPATH="/Users/jerrardpang/Desktop/" # path to save screenshots to (put a / at the end)
SCREENSHOTNAME="screenshot"                # screenshot name
SCREENSHOTFORMAT="png"                     # screenshot format

# editconfig
# settings for the editconfig script
EDIT="nvim"   # editor to launch config files in        (usage: nvim, emacsclient, emacs, vscode)
TERMINAL="kitty" # for nvim users, which terminal to use   (usage: kitty, alacritty) # iTerm not supported yet, sorry
