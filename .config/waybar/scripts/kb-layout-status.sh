#!/usr/bin/env bash

layout=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main) .active_keymap')

text="EN"
alt="en_white"
class="en"
case "$layout" in
*Russian* | *ru*) text="☭ RU" alt="ru" class="ru" ;;
*English*US* | *us*) text="󰌌 EN" alt="en" class="en" ;;
  # add more here if needed
esac

echo '{"text": "'$text'", "alt": "'$alt'", "class": "'$class'"}'
