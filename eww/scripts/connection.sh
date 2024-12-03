wired_status=$(nmcli device status | grep ethernet | awk '{print $3}')
wifi_status=$(nmcli device status | grep wifi | awk '{print $3}')
wifi_name=$(nmcli -t -f active,ssid dev wifi | grep "^yes" | cut -c1-5)

if [[ $wired_status == "connected" ]]; then
    echo "wired"
elif [[ $wifi_status == "connected" ]]; then
    echo "${wifi_name:0:5}"
else
    echo "no connection"
fi
