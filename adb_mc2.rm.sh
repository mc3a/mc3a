#!/bin/bash

# Get connected devices (skip header and empty lines)
DEVICESS=$(adb devices | tail -n +2 | grep -v '^$' | cut -f1)
DEVICES=$(adb devices | tail -n +2 | grep -v '^$' | cut -f1|head -1)
echo $DEVICESS | tee -a ../DEVICES.may25.txt
if [ -z "$DEVICES" ]; then
  echo "❌ No devices connected."
  #exit 1
fi

alias f1='for i in {1..100}; do adb -s 15798174540099O shell "input tap 500 500 && input tap 900 500 && input tap 900 500 && input tap 1204 540 && input tap 1500 500 && input tap 1900 500" ; done'
alias duck1_mc="adb  -s 15798174540099O shell input tap 250 900 && sleep 0.1 && adb  -s 15798174540099O shell input tap 250 900"
alias run1="adb -s 15798174540099O shell input tap 250 700 && sleep 0.1 && adb -s 15798174540099O shell input swipe 250 700 250 700 30000"
alias fff='for i in {1..100}; do adb -s 15798174540099O shell "input tap 500 500 && input tap 900 500 && input tap 900 500 && input tap 1204 540 && in
put tap 1500 500 && input tap 1900 500" ; done'
alias s180="adb -s 15798174540099O shell input swipe 700 500 1350 500 500"
alias run6="adb -s 15798174540099O shell input tap 250 700 && sleep 0.1 && adb -s 15798174540099O shell input swipe 250 700 250 700 6000"
run_first() {
  local DURATION=${1:-6000}  # Default to 6000ms if no argument is given
  adb -s 15798174540099O shell input tap 250 700
  sleep 0.1
  adb -s 15798174540099O shell input swipe 250 700 250 700 "$DURATION"
}



for DEVICE in $DEVICES; do
  echo "🔉 Turning volume down 5 times on device $DEVICE ..."
  for i in {1..5}; do
#    adb -s "$DEVICE" shell input keyevent 25  # KEYCODE_VOLUME_DOWN
#    adb -s "$DEVICE" shell input keyevent 25  # KEYCODE_VOLUME_DOWN
    adb -s "$DEVICE" shell input keyevent 25,   # KEYCODE_VOLUME_DOWN
    adb -s 15798174540099O shell "input swipe 1 1 800 800 500 && input swipe 200 2 200 2 500"
    adb -s 15798174540099O shell "input swipe 1200 400 1200 800 1000 && input swipe 1200 900 1200 700 25000" # look down dig up

    sleep 0.2
  done

  echo "🌑 Turning brightness down 40 times on device $DEVICE ..."
  for i in {1..40}; do
#    adb -s "$DEVICE" shell input keyevent 220  # KEYCODE_BRIGHTNESS_DOWN (API 21+)
#    adb -s "$DEVICE" shell input keyevent 220  # KEYCODE_BRIGHTNESS_DOWN (API 21+)
    adb -s "$DEVICE" shell input keyevent 220, KEYCODE_W, 51, 51, 51,51  # KEYCODE_BRIGHTNESS_DOWN (API 21+)
    for i in {1..20}; do adb -s 15798174540099O shell input keyevent 51; done

    sleep 0.1
  done
done

echo "✅ Volume and brightness adjusted on all devices."

