
#!/bin/bash

mic_source=$(pactl info | grep "Default Source:" | awk '{print $3}')

pactl set-source-mute "$mic_source" toggle

