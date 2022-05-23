#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm google-chrome-stable_current_amd64.deb

sudo apt install openssh-server -y
sudo apt install peek -y
sudo apt install variety -y
sudo apt install flatpak -y
sudo flatpak install https://flatpak.elementary.io/repo/appstream/com.github.phase1geo.annotator.flatpakref -y
sudo apt install snapd -y
sudo apt install gnome-tweaks -y

sudo apt install snapd -y
snap install spotify


sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y

dpkg --configure -a &&
apt update &&
apt upgrade -y &&
apt install -f &&
apt clean &&
apt autoclean &&
apt autoremove -y

sudo chmod +x *.sh

sudo echo 'user ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

echo Done

exit
