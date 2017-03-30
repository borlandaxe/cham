sudo ip link add name br0 type bridge &&
sudo ip addr add 192.168.100.1/24 dev br0 &&
sudo ip link set br0 up &&

sudo ip tuntap add dev tap0 mode tap user cham &&
sudo ip addr add 192.168.100.2/24 dev tap0 &&
sudo ip link set tap0 master br0 &&
sudo ip link set tap0 up &&

sudo sysctl net.ipv4.ip_forward=1 &&
sudo iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o wlp4s0 -j MASQUERADE
