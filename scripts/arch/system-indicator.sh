#echo -n "CPU:"
#sensors | grep "Physical" | awk '{print $4}' | sed 's\+\\' | xargs echo -n
cpu_temp=$(sensors | grep "Physical" | awk '{print $4}' | sed 's\+\\')
#echo -n "   GPU:"
#sensors | grep temp1 | awk '{print $2}' | sed 's\+\\' | sed -n '1p' | xargs echo -n
gpu_temp=$(sensors | grep temp1 | awk '{print $2}' | sed 's\+\\' | sed -n '1p')

netspeed=true

#---------------- initialize ---------------------------
rm /tmp/.sysmon > /dev/null 2>&1
dstat --net --mem --cpu --output=/tmp/.sysmon 1 1 > /dev/null 2>&1

#----------- up/down speed -----------------------------
if [ $netspeed = true ]; then

upspeed=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f2)/1024 | bc)

upkbmb=$(if [ $upspeed -gt 1024 ]; then
		up1=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f2)/1024/1024 | bc -l)
		echo $up1 | head -c 4
	elif [ $upspeed -lt 10 ]; then
		echo 0$upspeed | head -c 3
	else
		echo $upspeed | head -c 3
	fi)

downspeed=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f1)/1024 | bc)

downkbmb=$(if [ $downspeed -gt 1024 ]; then
		down1=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f1)/1024/1024 | bc -l)
		echo $down1 | head -c 4
	elif [ $downspeed -lt 10 ]; then
		echo 0$downspeed | head -c 3
	else
		echo $downspeed | head -c 3
	fi)
#---------------- up/down speed unit --------------------
upunit=$(if [ $upspeed -gt 1024 ]; then echo "M/s"; else echo "K/s"; fi)
downunit=$(if [ $downspeed -gt 1024 ]; then echo "M/s"; else echo "K/s"; fi)

fi

#echo "CPU:$cpu_temp GPU:$gpu_temp $upkbmb $upunit $downkbmb $downunit" | awk '{printf("%s   %s	↑%s%s  ↓%s%s", $1, $2, $3, $4,$5,$6)}'
echo "↑$upkbmb$upunit ↓$downkbmb$downunit	CPU:$cpu_temp   GPU:$gpu_temp	"


