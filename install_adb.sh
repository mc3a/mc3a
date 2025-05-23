#!/bin/bash

# Set download URL and destination folder
ADB_URL="https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
DEST_DIR="$HOME/platform-tools"

# Create a temporary directory for the ZIP file
TMP_ZIP="$HOME/platform-tools.zip"

echo "🔽 Downloading platform-tools..."
curl -o "$TMP_ZIP" "$ADB_URL"

echo "📦 Extracting platform-tools..."
mkdir -p "$DEST_DIR"
unzip -o "$TMP_ZIP" -d "$HOME" >/dev/null

# Clean up ZIP
rm "$TMP_ZIP"

# Add adb alias to .bashrc if not already present
if ! grep -q "alias adb=" ~/.bashrc; then
  echo "🔧 Adding adb alias to .bashrc..."
  echo "alias adb='$DEST_DIR/adb.exe'" >> ~/.bashrc
  echo "✅ Alias added. Run 'source ~/.bashrc' or restart Git Bash to use adb."
else
  echo "✅ adb alias already exists in .bashrc"
fi

echo "🎉 ADB installed successfully!"

