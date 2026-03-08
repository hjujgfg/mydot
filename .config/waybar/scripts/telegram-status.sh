#!/bin/sh

# Try multiple common Telegram binary names
names="telegram-desktop Telegram org.telegram.desktop"

running=""
for n in $names; do
  if pgrep -x "$n" >/dev/null 2>&1; then
    running="$n"
    break
  fi
done

if [ -n "$running" ]; then
  printf '{"text":"","class":"running","tooltip":"Telegram running (%s)"}' "$running"
else
  printf '{"text":"","class":"stopped","tooltip":"Telegram not running"}'
fi
