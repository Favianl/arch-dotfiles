#!/bin/bash

# Terminar cualquier instancia en ejecución de Polybar
killall -q polybar

# Lanzar Polybar utilizando la configuración
polybar myBar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Launch Polybar..."
