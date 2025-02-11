#!/usr/bin/env bash

pwr=$(echo -e " poweroff\n restart\n suspend\n lock\n logout" | wofi -i --dmenu | awk '{print tolower($2)}')

case $pwr in
    poweroff)
        exec systemctl poweroff
        ;;
    restart)
        exec systemctl reboot
        ;;
    suspend)
        exec systemctl suspend
        ;;
    lock)
        hyprlock
        ;;
    logout)
        hyprctl dispatch exit
        ;;
esac
