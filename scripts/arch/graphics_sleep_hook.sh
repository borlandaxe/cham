#!/bin/sh
case $1/$2 in
pre/*)
	/usr/bin/echo ON > /sys/kernel/debug/vgaswitcheroo/switch
	# Place your pre suspend commands here, or `exit 0` if no pre suspend action required
	;;
post/*)
	/usr/bin/echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
	# Place your post suspend (resume) commands here, or `exit 0` if no post suspend action required
	;;
esac
