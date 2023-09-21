#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]+%')
BAT_PERCENTAGE=${BAT%\%}

echo "$BAT"

exit 0
