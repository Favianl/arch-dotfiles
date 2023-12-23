#!/bin/bash

# Terminar cualquier instancia en ejecución de Polybar
killall -q polybar

# Establecer la ruta del archivo config.ini
config_file="$HOME/.config/polybar/config.ini"

# Lanzar Polybar con la configuración de tu amigo
launch_bars() {
    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        (MONITOR=$mon polybar -q pam1 -c "$config_file")&
        (MONITOR=$mon polybar -q pam2 -c "$config_file")&
        (MONITOR=$mon polybar -q pam3 -c "$config_file")&
        (MONITOR=$mon polybar -q pam4 -c "$config_file")&
        (MONITOR=$mon polybar -q pam5 -c "$config_file")&
        (MONITOR=$mon polybar -q pam6 -c "$config_file")&
    done
}

# Lanzar Polybar utilizando la configuración de tu amigo
launch_bars 2>&1 | tee -a /tmp/polybar.log & disown

echo "Launch Polybar..."
