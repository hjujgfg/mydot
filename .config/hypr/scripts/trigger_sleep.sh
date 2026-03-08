#!/usr/bin/env bash

systemctl suspend

notify-send -e \
  -a power-mode \
  -i "system-suspend" \
  -h string:x-canonical-private-synchronous:kb-layout \
  "Suspending" ""
