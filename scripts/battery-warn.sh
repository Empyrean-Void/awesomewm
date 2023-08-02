#!/bin/bash

# Check if libnotify is installed
if ! command -v notify-send &>/dev/null; then
  echo "Error: 'notify-send' command not found. Please install libnotify-bin."
  exit 1
fi

# Function to display a notification
function show_notification() {
  local title="$1"
  local message="$2"

  notify-send "$title" "$message"
}

# Check battery status using acpi
battery_status=$(acpi)

# Extract battery percentage using awk
battery_percentage=$(echo "$battery_status" | awk '{print $4}' | tr -d '%,')

# Low battery threshold (adjust this to your preference)
low_battery_threshold=25

# Check if the battery percentage is below the low battery threshold
if [ "$battery_percentage" -lt "$low_battery_threshold" ]; then
  title="Low Battery"
  message="Battery level is ${battery_percentage}%. Connect your charger."
  show_notification "$title" "$message"
fi
