#!/bin/bash

# Get connected devices (skip header and empty lines)
DEVICESS=$(adb devices | tail -n +2 | grep -v '^$' | cut -f1)
DEVICES=$(adb devices | tail -n +2 | grep -v '^$' | cut -f1|head -1)
echo $DEVICESS | tee -a ../DEVICES.may25.txt
if [ -z "$DEVICES" ]; then
  echo "❌ No devices connected."
  #exit 1
fi

for DEVICE in $DEVICES; do
  echo "🔉 Turning volume down 5 times on device $DEVICE ..."
  for i in {1..5}; do
#    adb -s "$DEVICE" shell input keyevent 25  # KEYCODE_VOLUME_DOWN
#    adb -s "$DEVICE" shell input keyevent 25  # KEYCODE_VOLUME_DOWN
    adb -s "$DEVICE" shell input keyevent 25,   # KEYCODE_VOLUME_DOWN
    sleep 0.2
  done

  echo "🌑 Turning brightness down 40 times on device $DEVICE ..."
  for i in {1..40}; do
#    adb -s "$DEVICE" shell input keyevent 220  # KEYCODE_BRIGHTNESS_DOWN (API 21+)
#    adb -s "$DEVICE" shell input keyevent 220  # KEYCODE_BRIGHTNESS_DOWN (API 21+)
    adb -s "$DEVICE" shell input keyevent 220, KEYCODE_W, 51, 51, 51,51  # KEYCODE_BRIGHTNESS_DOWN (API 21+)
    sleep 0.1
  done
done

echo "✅ Volume and brightness adjusted on all devices."

