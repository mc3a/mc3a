#!/bin/bash

# IP and port of the ADB device
DEVICE_IP="192.168.1.235"
PORT="5555"

# Full ADB target
ADB_TARGET="$DEVICE_IP:$PORT"

# Check if a key event is provided
if [ -z "$1" ]; then
    echo "❌ Usage: $0 <keycode>"
    echo "Example: $0 26   # Power button"
    echo "         $0 KEYCODE_HOME"
    exit 1
fi

# Ensure adb is available
if ! command -v adb &> /dev/null; then
    echo "❌ adb not found. Please install ADB and add it to your PATH."
    exit 1
fi

# Connect to the device
echo "🔗 Connecting to $ADB_TARGET..."
adb connect "$ADB_TARGET"

# Send the key event
echo "🎯 Sending key event: $1"
adb -s "$ADB_TARGET" shell input keyevent "$1"

# Show confirmation
echo "✅ Key event sent to $ADB_TARGET"

