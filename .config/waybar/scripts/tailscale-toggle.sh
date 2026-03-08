#!/bin/sh
if tailscale status >/dev/null 2>&1; then
  sudo tailscale down
else
  sudo tailscale up
fi

pkill -RTMIN+9 waybar
