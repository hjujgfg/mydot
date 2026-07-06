#!/bin/sh
CONNECTION="vpn-iefull-CHIE"

if ip link show dev "$CONNECTION"; then
  nmcli connection down "$CONNECTION"
else
  nmcli connection up "$CONNECTION"
fi

pkill -RTMIN+9 waybar
