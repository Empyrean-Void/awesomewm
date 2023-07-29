#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]+%')
BAT_PERCENTAGE=${BAT%\%}

echo "Battery: $BAT"

if [[ $BAT_PERCENTAGE -le 20 ]]; then
  echo "#f38ba8"
elif [[ $BAT_PERCENTAGE -le 60 ]]; then
  echo "#f9e2af"
elif [[ $BAT_PERCENTAGE -ge 95 ]]; then
  echo "#a6e3a1"
fi

exit 0
