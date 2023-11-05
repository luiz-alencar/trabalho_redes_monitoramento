apt update
apt install net-tools
#ifconfig enp0s3 donw
route del default gw 10.0.2.2
route add default gw 10.0.0.254l