#!/bin/bash

# Config
HEADPHONE_SINK="alsa_output.pci-0000_00_1b.0.analog-stereo"
HEADPHONE_SINK_PORT="analog-output-headphones"
DEFAULT_SINK="Snapcast"
DEFAULT_SINK_PORT=""

# Script
SINK=$DEFAULT_SINK
SINK_PORT=$DEFAULT_SINK_PORT

USERS="$(ps axc -o command,user | grep pulseaudio | tr -s ' ' | cut -f2 -d ' ' | sort | uniq)"

logger "ACPI event"
if [ "$1" = "jack/headphone" -a "$2" = "HEADPHONE" ]; then
    case "$3" in
        plug)
            logger "Headphones plugged"
            SINK=$HEADPHONE_SINK
            SINK_PORT=$HEADPHONE_SINK_PORT
            ;;
        *)
            logger "Headphones unplugged"
            SINK=$DEFAULT_SINK
            SINK_PORT=$DEFAULT_SINK_PORT
            ;;
    esac
    for user in $USERS;
    do
        logger "Change PA sink for $user"
        PULSE_RUNTIME_PATH=/run/user/$(id -u $user)/pulse su $user -c "pacmd set-sink-port $SINK $SINK_PORT; pactl set-default-sink $SINK"
    done
fi
