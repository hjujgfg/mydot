#!/usr/bin/env bash

# Options
lock="󰌾  Lock Screen"
suspend="󰤄  Suspend"
logout="󰍃  Logout"
reboot="󰑓  Reboot"
shutdown="󰐥  Shutdown"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen=$(printf '%b' "$options" | rofi -dmenu \
    -p "SYSTEM" \
    -theme-str 'window { width: 420px; } listview { lines: 5; }' \
    -selected-row 0)

case "$chosen" in
    "$lock")
        hyprlock
        ;;
    "$suspend")
        ~/.config/hypr/scripts/trigger_sleep.sh
        ;;
    "$logout")
        ~/.config/hypr/scripts/exit_hyprland.sh
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac
