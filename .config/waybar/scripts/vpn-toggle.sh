#!/bin/sh
SERVICE="openvpn-client@ie-62.protonvpn.udp.ovpn.service"

if sudo /usr/bin/systemctl is-active --quiet "$SERVICE"; then
  sudo /usr/bin/systemctl stop "$SERVICE"
else
  sudo /usr/bin/systemctl start "$SERVICE"
fi

pkill -RTMIN+9 waybar
