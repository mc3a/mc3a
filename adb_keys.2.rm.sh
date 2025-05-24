#!/bin/bash

# Device IP and port
DEVICE_IP="192.168.1.235"
PORT="5555"
ADB_TARGET="$DEVICE_IP:$PORT"

# Check input
if [ -z "$1" ]; then
    echo "❌ Usage: $0 <keycode or string>"
    echo "Examples:"
    echo "  $0 26               # Send Power button"
    echo "  $0 KEYCODE_HOME     # Send Home key"
    echo "  $0 'Hello World!'   # Type a string"
    return 1
fi

# Ensure adb is available
if ! command -v adb &> /dev/null; then
    echo "❌ adb not found. Please install ADB and add it to your PATH."
    return 1
fi

# Connect to device
echo "🔗 Connecting to $ADB_TARGET..."
adb connect "$ADB_TARGET" >/dev/null

# Determine if input is a keycode (number or starts with KEYCODE_)
if [[ "$1" =~ ^[0-9]+$ || "$1" =~ ^KEYCODE_ ]]; then
    echo "🎯 Sending key event: $1"
    adb -s "$ADB_TARGET" shell input keyevent "$1"
else
    # Escape special characters for input text
    ESCAPED_TEXT=$(echo "$@" | sed 's/ /%s/g; s/&/\\\&/g')
    echo "⌨️  Typing text: $ESCAPED_TEXT"
    adb -s "$ADB_TARGET" shell input text "$ESCAPED_TEXT"
fi

echo "✅ Input sent to $ADB_TARGET"

