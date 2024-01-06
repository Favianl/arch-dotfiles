#!/bin/bash
# changeVolume
 
# Arbitrary but unique message tag
msgTag="myvolume"

if [[ "$@" == "toggle" ]]; then
      pactl set-sink-mute @DEFAULT_SINK@ toggle > /dev/null
else

    vol_get_before=$(pactl list sinks | grep "Volume:" | awk 'NR==1 {print $5}' | sed 's/[^0-9]*//g')

    if [[ "$vol_get_before" -lt 150 && "$@" == "up" ]]; then
      # pactl set-sink-volume $(pactl info | grep 'Default Sink' | cut -d' ' -f 3) "$@" > /dev/null
      pactl set-sink-volume @DEFAULT_SINK@ "+5%" > /dev/null
      else if [[ "$@" == "down" ]]; then
      pactl set-sink-volume @DEFAULT_SINK@ "-5%" > /dev/null
      fi
    fi


    vol_get_after=$(pactl list sinks | grep "Volume:" | awk 'NR==1 {print $5}' | sed 's/[^0-9]*//g')

    if [ "$vol_get_after" -lt 5 ]; then
      pactl set-sink-mute @DEFAULT_SINK@ 1 > /dev/null
    fi

    if [[ "$@" == "up" ]]; then
      pactl set-sink-mute @DEFAULT_SINK@ 0 > /dev/null
    fi
fi
 

vol_get=$(pactl list sinks | grep "Volume:" | awk 'NR==1 {print $5}' | sed 's/[^0-9]*//g')

# Get current volume and whether or not the speaker is muted
volume="$(pactl list sinks | grep -A 7 "$(pactl info | grep 'Default Sink' | cut -d' ' -f 3)" | grep Volume | awk '{print $5}')"

mute="$(pactl list sinks | grep -A 7 "$(pactl info | grep 'Default Sink' | cut -d' ' -f 3)" | grep Mute | awk '{print $2}')"

if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    dunstify -t 1000 -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"0" -i /usr/share/icons/Papirus/16x16/panel/audio-volume-muted.svg "0%"
else
  # if [ "$vol_get" -gt 100 ]; then
  #   dunstify -t 1000 -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
  #     -h int:value:"$volume" -i /usr/share/icons/Papirus/16x16/panel/audio-volume-high.svg "${volume}"
  #       else
  # fi
    # Show the volume notification
    dunstify -t 1000 -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" -i /usr/share/icons/Papirus/16x16/panel/audio-volume-high.svg "${volume}"
fi
 



