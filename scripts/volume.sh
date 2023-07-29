#!/bin/bash

# Get the volume percentage using pactl
volume=$(pactl list sinks | awk '/^[[:space:]]Volume:/{print $5; exit}')

# Print the volume percentage
echo 'Volume: '$volume
