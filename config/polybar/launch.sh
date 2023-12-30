#!/bin/bash

# Terminar cualquier instancia en ejecución de Polybar
killall -q polybar

# Lanzar Polybar utilizando la configuración de tu amigo
polybar myBar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Launch Polybar..."
