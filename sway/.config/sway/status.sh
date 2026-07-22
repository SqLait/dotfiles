#!/bin/sh

while true; do
  #datetime=$(date '+%Y-%m-%d :: %H:%M')
  datetime=$(date '+%a %d %b :: %H:%M')

  battery=$(upower -b | grep percentage | awk '{print $2}')

  echo "Bat: ${battery:-N/A} | $datetime"
  
  sleep 1
done   
