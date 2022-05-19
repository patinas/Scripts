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

sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
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


(crontab -l ; echo "*/30 * * * * /root/scripts/update.sh >/dev/null 2>&1")| crontab -

chmod +x *.sh

sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install alacritty
sudo mv /root/scripts/alacritty /home/user/.config/

sudo apt install awesome -y
sudo apt install rofi -y
sudo apt install pcmanfm -y
sudo mkdir /home/user/.config/awesome/
cd /root/scripts
sudo mv rc.lua /home/user/.config/awesome/
sudo cp mytheme.lua /usr/share/awesome/themes/default/

sudo chown -R user:user /home/user

sudo apt install bluez bluez-tools -y
sudo apt install ntp -y
sudo timedatectl set-timezone Europe/Copenhagen

sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev -y


echo Done

exit
