#!/bin/bash
:<< C
count=0
while true;
do
	if [ -f /sys/kernel/debug/vgaswitcheroo/switch ];then
		break
	else
		sleep 1
		count=`expr $count + 1`
		if [ $count -ge 5 ];then
			exit 1
		fi
	fi
done

count=0
#if [ -f /sys/kernel/debug/vgaswitcheroo/switch ];then
	while true;
	do
		if [ -z `/usr/bin/lsmod | grep amdgpu | head -1 | awk '{print $1}'` ];then
		#	echo "no amdgpu" >> /home/cham/result
			sleep 1;
			count=`expr $count + 1`
			if [ $count -ge 5 ];then
				break
			fi
		else
			sleep 2
		#	echo "driver loaded." >> /home/cham/result
			echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
			break
		fi
	done
	cat /sys/kernel/debug/vgaswitcheroo/switch > /home/cham/result_1
#fi

#disable IPv6 system-widely
#echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

C

/usr/bin/echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
