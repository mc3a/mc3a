#!/bin/bash

# Get list of connected devices (skip the first line and empty lines)
DEVICES=$(adb devices | tail -n +2 | grep -v '^$' | cut -f1)

if [ -z "$DEVICES" ]; then
  echo "❌ No devices connected."
  exit 1
fi

for DEVICE in $DEVICES; do
  echo "🔇 Muting device $DEVICE ..."

  # Mute media volume by setting volume to 0 using service call audio (works on many devices)
  adb -s "$DEVICE" shell "service call audio 7 i32 3 i32 0 i32 1"

  # Alternative: uncomment if the above doesn't work
  # adb -s "$DEVICE" shell "media volume --stream 3 --set 0"

  # Or using settings (may require root on some devices)
  # adb -s "$DEVICE" shell "settings put system volume_music 0"
done

echo "✅ All devices muted."

