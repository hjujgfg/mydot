#!/bin/sh

readtemp() {
  [ -f "$1" ] && awk '{printf "%d", $1/1000}' "$1"
}

cpu="$(readtemp /sys/class/hwmon/hwmon4/temp1_input)"
gpu_edge="$(readtemp /sys/class/hwmon/hwmon3/temp1_input)"
gpu_hot="$(readtemp /sys/class/hwmon/hwmon3/temp2_input)"
nvme0="$(readtemp /sys/class/hwmon/hwmon0/temp1_input)"
nvme1="$(readtemp /sys/class/hwmon/hwmon1/temp1_input)"
nvme2="$(readtemp /sys/class/hwmon/hwmon2/temp1_input)"
ram1="$(readtemp /sys/class/hwmon/hwmon7/temp1_input)"
ram2="$(readtemp /sys/class/hwmon/hwmon8/temp1_input)"

tooltip="CPU: ${cpu}°C\nGPU edge: ${gpu_edge}°C\nGPU hotspot: ${gpu_hot}°C\nNVMe0: ${nvme0}°C\nNVMe1: ${nvme1}°C\nNVMe2: ${nvme2}°C\nRAM1: ${ram1}°C\nRAM2: ${ram2}°C"

printf '{"text":" %s°C","tooltip":"%s"}' "$cpu" "$tooltip"
