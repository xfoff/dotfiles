MIC=$(pactl list short sources | grep 'mono' | awk '{print $1}')
STATUS=$(pactl list sources | grep -A 15 "Source #$MIC" | grep "Mute" | awk '{print $2}')

[ "$STATUS" == "yes" ] && pactl set-source-mute $MIC 0 || pactl set-source-mute $MIC 1
