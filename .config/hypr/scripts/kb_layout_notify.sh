#!/usr/bin/env bash

hyprctl switchxkblayout all next

layout=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main) .active_keymap')

short="EN"
icon="en_white"
case "$layout" in
*Russian* | *ru*) short="РУССССКИЙ" icon="ru_white" ;;
*English*US* | *us*) short="ENGLISH" icon="en_white" ;;
  # add more here if needed
esac

notify-send -e \
  -a kb-layout \
  -i "$icon" \
  -u low \
  -h string:x-canonical-private-synchronous:kb-layout \
  "$short" ""

pkill -RTMIN+8 waybar
