#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

sudo apt update && sudo apt upgrade -y

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

sudo apt install openssh-server -y


sudo chmod u+x ~/post_install_linux/post_install.sh

sudo apt update && sudo apt upgrade -y

exit
