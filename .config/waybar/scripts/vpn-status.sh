#!/bin/sh
CONNECTION="vpn-iefull-CHIE"

if ip link show dev "$CONNECTION" >/dev/null 2>&1; then
  printf '{"text":"","class":"running","tooltip":"%s running"}' "$CONNECTION"
else
  printf '{"text":"","class":"stopped","tooltip":"%s stopped"}' "$CONNECTION"
fi
