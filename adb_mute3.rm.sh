#!/bin/bash

# Get list of connected devices (skip header and empty lines)
DEVICES=$(adb devices | tail -n +2 | grep -v '^$' | cut -f1)

if [ -z "$DEVICES" ]; then
  echo "❌ No devices connected."
  exit 1
fi

for DEVICE in $DEVICES; do
  echo "🔉 Turning volume down 5 times on device $DEVICE ..."
  for i in {1..5}; do
    adb -s "$DEVICE" shell input keyevent 25  # 25 = KEYCODE_VOLUME_DOWN
    sleep 0.2  # small delay to ensure the key event registers
  done
done

echo "✅ Volume turned down 5 times on all devices."

