
user=$1
outlet=$2

sudo ip link add name br0 type bridge &&
sudo ip addr add 192.168.100.1/24 dev br0 &&
sudo ip link set br0 up &&

sudo ip tuntap add dev tap0 mode tap user $user &&
sudo ip addr add 192.168.100.10/24 dev tap0 &&
sudo ip link set tap0 master br0 &&
sudo ip link set tap0 up &&

sudo ip tuntap add dev tap1 mode tap user $user &&
sudo ip addr add 192.168.100.11/24 dev tap1 &&
sudo ip link set tap1 master br0 &&
sudo ip link set tap1 up &&

sudo sysctl net.ipv4.ip_forward=1 &&
sudo iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o $outlet -j MASQUERADE
