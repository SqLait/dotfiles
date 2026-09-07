#!/bin/sh

while true; do
    datetime=$(date '+%a %d %b :: %H:%M')

    battery=$(upower -b | grep percentage | awk '{print $2}')
    net=$(cat /sys/class/net/wlan0/operstate 2>/dev/null)   

    echo "bat: ${battery:-N/A} | wlan0: ${net:-down} | $datetime"

    sleep 1
done   
