#!/bin/sh
SERVICE="openvpn-client@ie-62.protonvpn.udp.ovpn.service"

if sudo /usr/bin/systemctl is-active --quiet "$SERVICE"; then
  printf '{"text":"","class":"running","tooltip":"%s running"}' "$SERVICE"
else
  printf '{"text":"","class":"stopped","tooltip":"%s stopped"}' "$SERVICE"
fi
