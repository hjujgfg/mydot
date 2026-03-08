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
  ICON=""
  NAME="Mouse"
elif [[ "$DEVICE_TYPE" == "keyboard" ]]; then
  SOLAAR_OUTPUT=$(solaar show 4B865C30)
  PERCENT=$(echo "$SOLAAR_OUTPUT" | grep -i -A 20 "Keyboard" | grep "Battery" | grep -oP '\d+%' | head -1)
  ICON=""
  NAME="Keyboard"
fi

# 3. Handle Empty/Offline state
if [ -z "$PERCENT" ]; then
  # Option A: Show nothing (collapse)
  # echo ""
  # exit 0

  # Option B: Show empty state
  PERCENT="--"
  CLASS="disconnected"
else
  CLASS="connected"
fi

# 4. Output JSON for Waybar
# We strip the % sign for the class so you can style specific battery levels if you want (e.g. class-10)
NUM_VAL=$(echo "$PERCENT" | tr -d '%')

echo "{\"text\": \"$ICON $PERCENT\", \"tooltip\": \"$NAME: $PERCENT\", \"class\": \"$CLASS\", \"percentage\": $NUM_VAL}"
