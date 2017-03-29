#!/bin/bash
/usr/bin/echo ON > /sys/kernel/debug/vgaswitcheroo/switch
/usr/lib/systemd/systemd-sleep suspend
