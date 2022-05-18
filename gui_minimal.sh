#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install xfce4 -y
sudo apt install curl -y

sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

sudo chmod +x *.sh

curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y

sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

sudo apt install snapd -y
snap install remmina

echo Done
