#!/bin/bash
sudo dpkg --configure -a &&
sudo apt update &&
sudo apt upgrade -y &&
sudo apt install -f &&
sudo apt clean &&
sudo apt autoclean &&
sudo apt autoremove -y

sudo chmod +x *.sh

cat <<EOF | crontab -
* 1 * * * /home/user/post_install_linux/update.sh
EOF
