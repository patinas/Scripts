#!/bin/bash
dpkg --configure -a &&
apt update &&
apt upgrade -y &&
apt install -f &&
apt clean &&
apt autoclean &&
apt autoremove -y

sudo chmod +x *.sh

cat <<EOF | crontab -
* 1 * * * /home/user/post_install_linux/update.sh
EOF

sudo visudo | sudo echo "user ALL=(ALL:ALL) NOPASSWD: ALL"
