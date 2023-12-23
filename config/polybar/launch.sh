#!/bin/bash

# Terminate already running bar instances

# killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini

# polybar myBar 2>&1 | tee -a /tmp/polybar.log & disown

# echo "Polybar launched..."

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -q pam1 -c config.ini)&
		(MONITOR=$mon polybar -q pam2 -c config.ini)&
		(MONITOR=$mon polybar -q pam3 -c config.ini)&
		(MONITOR=$mon polybar -q pam4 -c config.ini)&
		(MONITOR=$mon polybar -q pam5 -c config.ini)&
		(MONITOR=$mon polybar -q pam6 -c config.ini)&
	done
