if [ "$WFF" = "" ];then
	
sudo route del default gw 192.168.7.133
sudo iptables -F
sudo iptables -t nat -A POSTROUTING -s 192.168.7.0/24 -o eth0 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE

echo first time

fi
