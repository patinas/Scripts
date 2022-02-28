#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

sudo apt install openssh-server -y
sudo apt install peek -y
sudo apt install variety -y
sudo apt install flatpak -y
flatpak install https://flatpak.elementary.io/repo/appstream/com.github.phase1geo.annotator.flatpakref
sudo apt install snapd -y

sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y

echo Done

exit
