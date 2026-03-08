#!/bin/sh
if pgrep -x steam >/dev/null; then
  printf '{"text":"","class":"running","tooltip":"Steam running"}'
else
  printf '{"text":"","class":"stopped","tooltip":"Steam not running"}'
fi
