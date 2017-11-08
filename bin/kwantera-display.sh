#!/bin/bash
if [ -f ~/kwantera  ]; then
    xrandr --output "DVI-I-1" --auto
    xrandr --output "HDMI-0" --auto --right-of "DVI-I-1"
    xrandr --output "DP-0" --primary --mode 1920x1080 --left-of "DVI-I-1"
fi
