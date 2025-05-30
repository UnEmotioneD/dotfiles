#!/usr/bin/zsh

if pgrep -x "hyprpaper" > /dev/null; then
    killall hyprpaper
fi
hyprpaper &

if pgrep -x "waybar" > /dev/null; then
    killall waybar
fi
waybar

if pgrep -x "xremap" > /dev/null; then
    killall xremap
fi
xremap ~/.config/xremap/config.yml
