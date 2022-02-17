#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

sudo apt install peek -y
sudo apt install remmina -y
sudo apt install variety -y
sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

sudo chmod +x post_install_minimal.sh

sudo apt update
sudo apt install snapd -y

sudo apt update && sudo apt upgrade -y

echo Done

exit
