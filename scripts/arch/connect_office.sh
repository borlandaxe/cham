wpa_supplicant -B -i wlp4s0 -f /home/cham/var/log -c /home/cham/conf-tmp/net-config &&
ifconfig wlp4s0 192.168.10.188 &&
route add default gw 192.168.10.12
#sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
