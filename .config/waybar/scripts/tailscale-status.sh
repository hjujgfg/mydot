#!/bin/sh

svc_active() { systemctl is-active --quiet tailscaled; }
svc_enabled() { systemctl is-enabled --quiet tailscaled; }

ts_up() {
  tailscale status 2>/dev/null | grep -qv '^Tailscale is stopped'
}

if svc_active; then
  if ts_up; then
    ip="$(tailscale ip -4 2>/dev/null | head -n1)"
    st="$(tailscale status 2>/dev/null | head -n 20)"
    #    tooltip="Tailscale UP\nIP: $ip\nDevices:\n"
    tooltip=$(
      cat <<EOF
      Tailscale UP
IP: $ip
Devices:
$st
EOF
    )
    tooltip_escaped=$(printf '%s' "$tooltip" | sed ':a;N;$!ba;s/\n/\\n/g; s/"/\\"/g')

    printf '{"text": "󰖂", "class":"up", "tooltip":"%s"}' "$tooltip_escaped"
    #printf '{"text":"󰖂","class":"up","tooltip":"Tailscale: UP\nIP: %s\n\n%s\n\nLeft click: down"}' "$ip" "$st"
  else
    printf '{"text": "󰖂", "class":"down", "tooltip": "Tailscale DOWN"}'
    #printf '{"text":"󰖂","class":"down","tooltip":"Tailscale: DOWN\n\nLeft click: up"}'
  fi
else
  if svc_enabled; then

    printf '{"text": "󰖂"}'
    #printf '{"text":"󰖂","class":"down","tooltip":"Tailscale service stopped\n\nLeft click: start"}'
  else
    printf '{"text": "󰖂"}'
    #printf '{"text":"󰖂","class":"disabled","tooltip":"Tailscale service disabled\n\nEnable service to use"}'
  fi
fi
