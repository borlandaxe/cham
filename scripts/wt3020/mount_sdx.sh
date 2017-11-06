#!/bin/bash
if [ $# != 1 ];then
		echo "input."
		exit 1
fi

flag=$(mount | grep "$HOME/wt")

if [ ! "$flag" = "" ];then
		echo "occupied."
		exit 1
fi

sudo mount -t cifs //192.168.7.151/public/$1 $HOME/wt -o vers=1.0,defaults,uid=1000,gid=1000,username=admin,password=admin
