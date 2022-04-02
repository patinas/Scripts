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
flatpak install https://flatpak.elementary.io/repo/appstream/com.github.phase1geo.annotator.flatpakref -y
sudo apt install snapd -y
sudo apt install gnome-tweaks -y
sudo apt install snapd -y
snap install spotify

## Remote Desktop
sudo apt remove xrdp vnc4server tightvncserver -y
sudo apt install tightvncserver -y
sudo apt install xrdp -y
sudo service xrdp restart



## Window Manager
sudo add-apt-repository ppa:regolith-linux/stable -y
sudo apt install regolith-desktop-standard -y
sudo apt install regolith-look-ayu -y
regolith-look refresh
sudo cp config /etc/regolith/i3/

cat > /home/user/.Xresources-regolith <<EOF
i3-wm.gaps.inner.size: 20
gnome.terminal.font:	JetBrains Mono 15
EOF
regolith-look refresh

SetLook="regolith-look set ayu"
$SetLook 

## Autostart
sudo cp -r autostart ~/.config/

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


(crontab -l ; echo "*/30 * * * * /root/post_install_linux/update.sh >/dev/null 2>&1")| crontab -
chmod +x *.sh

sudo cat > crontab -l <<EOF
*/30 * * * * /root/scripts/update.sh >/dev/null 2>&1
EOF


echo Done

exit
