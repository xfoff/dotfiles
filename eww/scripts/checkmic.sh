MIC=$(pactl list short sources | grep 'mono' | awk '{print $1}')

STATUS=$(pactl list sources | grep -A 15 "Source #$MIC" | grep "Mute" | awk '{print $2}')

if [ "$STATUS" == "yes" ]; then
  echo "true"
else
  echo "false"
fi
