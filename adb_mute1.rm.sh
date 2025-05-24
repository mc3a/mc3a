#!/bin/bash

# List of device IDs
DEVICES=(
  "15798174540099O"
  "192.168.1.235:5555"
)

# Mute command: set media volume to 0
MUTE_CMD="media volume --stream 3 --set 0"

for DEVICE in "${DEVICES[@]}"; do
  echo "🔇 Muting device $DEVICE ..."
  adb -s "$DEVICE" shell media volume --stream 3 --set 0
done

echo "✅ All devices muted."

