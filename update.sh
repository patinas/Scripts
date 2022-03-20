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

echo "user ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-user-for-sudo-password
