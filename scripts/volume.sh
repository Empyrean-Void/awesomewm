#!/bin/bash

# Get the volume and mute status using pactl for the first sink
volume_info=$(pactl list sinks | awk '/^[[:space:]]Volume:/{v=$5; sub(/%$/, "", v); exit} /^[[:space:]]Mute:/{m=$2} END{print v, m}')
volume_percentage=$(echo "$volume_info" | awk '{print $1}')

# Set a default value for mute status if not found (assuming not muted)
mute_status=$(echo "$volume_info" | awk '{print $2}')
if [ -z "$mute_status" ]; then
    mute_status="no"
fi

# Print the volume percentage and mute status
echo "Volume: $volume_percentage%"
echo "Muted: $mute_status"
