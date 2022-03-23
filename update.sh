#!/bin/sh
sudo dpkg --configure -a &&
sudo apt update &&
sudo apt install libnotify-bin -y 
sudo apt upgrade -y &&
sudo apt install -f &&
sudo apt clean &&
sudo apt autoclean &&
sudo apt autoremove -y
sudo flatpak update -y

sudo chmod +x *.sh

cat <<EOF | crontab -
*/30 * * * * /root/post_install_linux/update.sh
*/5 * * * * /root/dotfiles/sync.sh
EOF
