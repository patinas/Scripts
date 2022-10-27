#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

sudo apt install xrdp -y
sudo systemctl start xrdp
sudo systemctl enable xrdp
sudo adduser xrdp ssl-cert
gnome-session-save --force-logout
