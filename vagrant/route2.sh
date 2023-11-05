sudo sysctl -w net.ipv4.ip_forward=1
apt update
apt install net-tools
sudo apt install tcpdump

#ifconfig enp0s3 down
route del default gw 10.0.2.2

sudo route add -net 192.168.0.0/24 gw 192.168.50.254
sudo route add -net 10.0.0.0/24 gw 10.0.0.254