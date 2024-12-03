read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
prev_idle=$idle
prev_total=$((user + nice + system + idle + iowait + irq + softirq + steal))

sleep 1

read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
idle_diff=$((idle - prev_idle))
total_diff=$(( (user + nice + system + idle + iowait + irq + softirq + steal) - prev_total ))

cpu_usage=$((100 * (total_diff - idle_diff) / total_diff))

echo $cpu_usage
