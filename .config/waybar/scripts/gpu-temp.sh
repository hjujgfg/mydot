#!/bin/sh

temp="$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)"

case "$temp" in
'' | *[!0-9]*)
  printf '{"text":" --°C","class":"gpu-unknown","tooltip":"GPU temperature unavailable"}'
  exit 0
  ;;
esac

class="gpu-cool"
[ "$temp" -ge 60 ] && class="gpu-warm"
[ "$temp" -ge 75 ] && class="gpu-hot"

printf '{"text":"󱃃%s°C","class":"%s","tooltip":"GPU temperature: %s°C"}' "$temp" "$class" "$temp"
