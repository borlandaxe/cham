route del default gw 192.168.7.133
iptables -F
iptables -t nat -A POSTROUTING -s 192.168.7.0/24 -o eth0 -j MASQUERADE
