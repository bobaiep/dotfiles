#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if hostname -s | grep -q "boba-xps13"; then
    # Launch bar1 and bar2
    polybar -c ~/.config/polybar/config main-laptop -r >>/tmp/polybar1.log 2>&1 & disown
else
    polybar -c ~/.config/polybar/config  main -r >>/tmp/polybar1.log 2>&1 & disown
    polybar -c ~/.config/polybar/config main2 -r >>/tmp/polybar2.log 2>&1 & disown
fi

echo "Bars launched..."
