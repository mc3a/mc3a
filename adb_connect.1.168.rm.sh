#!/bin/bash

# IP address of the device
DEVICE_IP="192.168.1.235"
PORT=5555

# Check if adb is available
if ! command -v adb &> /dev/null; then
    echo "❌ adb command not found. Please install ADB and ensure it's in your PATH."
    exit 1
fi

echo "📱 Connecting to ADB device at $DEVICE_IP:$PORT..."

# Connect to the device
adb connect "$DEVICE_IP:$PORT"

# Check the connection
echo "🔍 Listing connected devices:"
adb devices

