#!/bin/sh

BATTERY="BAT0"

if [ ! -d "/sys/class/power_supply/$BATTERY" ]; then
    echo "No Battery" && exit 1
fi

capacity=$(cat /sys/class/power_supply/$BATTERY/capacity)
status=$(cat /sys/class/power_supply/$BATTERY/status)

# Set text status based on charging state
if [ "$status" = "Charging" ]; then
    state="Charging"
else
    state="Discharging"
fi

# This will output: "charging 85%" or "discharging 42%"
echo "$state $capacity%"