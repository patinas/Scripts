#!/bin/sh

apt update
systemctl stop systemd-resolved.service


grep -v "nameserver 127.0.0.53" /etc/resolv.conf > tmpfile && mv tmpfile /etc/resolv.conf


tee -a /etc/resolv.conf <<EOF
nameserver 8.8.8.8
EOF

apt update
apt install docker.io -y

apt install git -y
git clone https://github.com/patinas/pihole
cd pihole

chmod u+x pihole.sh
./pihole.sh

docker exec -it pihole bash
pihole -a -p
