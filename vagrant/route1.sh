apt update
apt install net-tools
route del default gw 10.0.2.2
route add default gw 192.168.50.254