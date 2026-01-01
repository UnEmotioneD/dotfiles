#!/usr/bin/env bash

# Get connected displays
CONNECTED=$(xrandr --query | grep " connected" | cut -d" " -f1)

# PC monitor
if echo "$CONNECTED" | grep -q "DP-4"; then
    xrandr --output DP-4 --mode 2560x1440 --rate 239.97
fi

# Laptop display
if echo "$CONNECTED" | grep -q "eDP-1"; then
    xrandr --output eDP-1 --mode 1920x1080 --rate 144
fi

# Extended monitor
if echo "$CONNECTED" | grep -q "HDMI-1"; then
    xrandr \
        --output HDMI-1 \
        --mode 1920x1080 \
        --rate 60 \
        --rotate left \
        --right-of eDP-1

    i3-msg 'workspace Y: extend; move workspace to output HDMI-1'
fi

# Turn off disconnected outputs (optional)
for output in $(xrandr --query | grep " disconnected" | cut -d" " -f1); do
    xrandr --output "$output" --off
done

