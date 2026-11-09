#!/bin/bash

# Usage: ./solaar_battery.sh "mouse" OR ./solaar_battery.sh "keyboard"
DEVICE_TYPE=$1

# 1. Get the full Solaar output once to save resources

# 2. Parse based on requested device type
if [[ "$DEVICE_TYPE" == "mouse" ]]; then

  SOLAAR_OUTPUT=$(solaar show D7E9E18E)
  # Find section with "Mouse", look for Battery lines, grab percentage
  # Note: We use -A 20 to scan enough lines after finding the device name
  PERCENT=$(echo "$SOLAAR_OUTPUT" | grep -i -A 20 "Mouse" | grep "Battery" | grep -oP '\d+%' | head -1)
  if [ -z "$PERCENT" ]; then
    PERCENT=$(upower -i /org/freedesktop/UPower/devices/battery_hidpp_battery_1 2>/dev/null | grep 'percentage:' | awk '{print $2}')
  fi
  ICON="MSE"
  NAME="Mouse"
elif [[ "$DEVICE_TYPE" == "keyboard" ]]; then
  SOLAAR_OUTPUT=$(solaar show 4B865C30)
  PERCENT=$(echo "$SOLAAR_OUTPUT" | grep -i -A 20 "Keyboard" | grep "Battery" | grep -oP '\d+%' | head -1)
  ICON="KB"
  NAME="Keyboard"
fi

# 3. Handle Empty/Offline state
if [ -z "$PERCENT" ] || [ "$PERCENT" = "--" ]; then
  PERCENT="--"
  CLASS="disconnected"
  NUM_VAL=0
else
  NUM_VAL=$(echo "$PERCENT" | tr -d '%')
  if [ "$NUM_VAL" -le 10 ]; then
    CLASS="critical"
  elif [ "$NUM_VAL" -le 25 ]; then
    CLASS="warning"
  else
    CLASS="connected"
  fi
fi

# 4. Output JSON for Waybar
echo "{\"text\": \"$ICON $PERCENT\", \"tooltip\": \"$NAME: $PERCENT\", \"class\": \"$CLASS\", \"percentage\": $NUM_VAL}"
