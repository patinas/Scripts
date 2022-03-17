#!/bin/bash
dpkg --configure -a &&
apt update &&
apt upgrade -y &&
apt install -f &&
apt clean &&
apt autoclean &&
apt autoremove -y

sudo chmod +x ~/post_install_linux/*

cat <<EOF | crontab -
* 1 * * * ~/post_install_linux/update.sh
EOF
