MIC=$(pactl list short sources | grep 'mono' | awk '{print $1}')
pactl set-source-mute $MIC 1
