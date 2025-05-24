#!/bin/bash

DEVICE=${1:-$(adb devices | awk 'NR==2 {print $1}')}
echo "📱 Using device: $DEVICE"

# Get screen resolution
RES=$(adb -s "$DEVICE" shell wm size | grep -oE '[0-9]+x[0-9]+')
WIDTH=$(echo $RES | cut -d'x' -f1)
HEIGHT=$(echo $RES | cut -d'x' -f2)
X=$((WIDTH / 2))
Y=$((HEIGHT / 2))

echo "📏 Screen resolution: $WIDTH x $HEIGHT"
echo "📍 Tapping at center: $X, $Y"

for i in {1..100}; do
  adb -s "$DEVICE" shell input tap "$X" "$Y"
  sleep 0.05  # optional delay
done

echo "✅ Tapped center 100 times."

