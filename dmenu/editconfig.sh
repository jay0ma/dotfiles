#! /usr/bin/env sh

# get config(s)
. ~/.config/dmenu/config.sh

# list configs
choice=$(printf \
         "alacritty - ~/.config/alacritty/alacritty.yml \\
doom emacs config - ~/.doom.d/config.el \\
doom emacs init - ~/.doom.d/init.el\\
doom emacs packages - ~/.doom.d/packages.el \\
sesame -  ~/Library/Application\ Support/sesame/config.json \\
geany - ~/.config/geany/geany.conf \\
kitty - ~/.config/kitty/kitty.conf \\
neovim - ~/.config/nvim/init.lua \\
rofi - ~/.config/rofi/config.rasi \\
sketchybar - ~/.config/sketchybar/sketchybarrc \\
skhd - ~/.config/skhd/skhdrc \\
yabai - ~/.config/yabai/yabairc \\
starship - ~/.config/starship.toml \\
tmux - ~/.tmux.conf \\
dmenuconfig - ~/.config/dmenu/config.sh \\
zsh - ~/.zshrc \
"\
| sed 's/\\//' | ${DMENU} "Edit config:") # pipe configs into dmenu

final=$(cut -d "-" -f2- <<< "$choice") # store the path to desired config in a variable

# check if choice is empty
if [ -z "$choice" ]; then
    exit             # if it is, exit
else
    kitty --single-instance $EDIT $final  # if not, open the selected config in the editor
fi
