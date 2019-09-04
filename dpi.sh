#!/bin/bash
# Devices
LEFT="DP-4"
RIGHT="DP-0"

# Modes
_4K=3840x2160
_1080P=1920x1200

echo "setting frame buffer" &&
xrandr --fb 6240x3840 && 
echo "configuring LEFT" &&
xrandr --output $LEFT --mode "$_4K" --panning 3840x2160+0+1680 --primary &&
echo "configuring RIGHT" &&
# xrandr --output $RIGHT --mode "$_1080P"  --scale-from 3840x2400 --panning 2400x3840+3840+0 --right-of $LEFT --rotate left &&
xrandr --output $RIGHT --mode "$_1080P"  --scale-from 3840x2400 --panning 2400x3840+3840+0 --right-of $LEFT &&
echo "setting global scale factor" &&
gsettings set org.gnome.desktop.interface scaling-factor 2
# need to logout to take effect (maybe)
