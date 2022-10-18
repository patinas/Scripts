#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

adduser rdpuser
usermod -aG sudo rdpuser
apt-get update
apt-get install xrdp
systemctl start xrdp
systemctl start xrdp-sesman
systemctl enable xrdp
systemctl enable xrdp-sesman
