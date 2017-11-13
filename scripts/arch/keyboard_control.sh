if [ "$1" = "enable" ];then
	value=1
elif [ "$1" = "disable" ];then
	value=0
else
	echo "usage:sh $0 enable|disable"
	exit 1
fi
echo $value

#keyboad & trackpad
id=$(xinput --list | grep "Apple" | awk '{print $9}' | awk -F '=' '{print $2}')
xinput set-int-prop $id "Device Enabled" 8 $value

#power button
id=$(xinput --list | grep "Power" | awk '{print $4}' | head -1 | awk -F '=' '{print $2}')
xinput set-int-prop $id "Device Enabled" 8 $value
