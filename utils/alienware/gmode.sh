#!/bin/bash

current_profile=$(tuned-adm active | awk -F': ' '{print $2}')

is_ac=$(cat /sys/class/power_supply/AC/online)

if [ "$current_profile" = "throughput-performance" ]; then
    if [ "$is_ac" -eq "1" ]; then
    	tuned-adm profile balanced
    else
    	tuned-adm profile powersave
    fi
else
    tuned-adm profile throughput-performance
fi
