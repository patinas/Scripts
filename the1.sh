#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y
apt install timeshift -y
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

# curl https://packages.expandrive.com/keys/expandrive.asc | gpg – dearmor > packages.expandrive.gpg
# sudo install -o root -g root -m 644 packages.expandrive.gpg /usr/share/keyrings/
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.expandrive.gpg] https://packages.expandrive.com/expandrive stable main" > /etc/apt/sources.list.d/expandrive.list'
# sudo apt-get install apt-transport-https
# sudo apt-get update
# sudo apt-get install expandrive

sudo apt install snapd -y
sudo snap install mailspring

mkdir /home/user/AppImages
cd /home/user/AppImages
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.0/Obsidian-1.0.0.AppImage
chmod +x *.AppImage
wget https://forum.obsidian.md/uploads/default/original/2X/6/663886873dba65def747edf8ebf752a0a8d09db0.jpeg
mv 663886873dba65def747edf8ebf752a0a8d09db0.jpeg obsidian_image.jpg
tee ~/.local/share/applications/obsidian.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Obsidian
Comment=Obsidian
Icon=/home/user/AppImages/obsidian_image.jpg
Exec=/home/user/AppImages/Obsidian-1.0.0.AppImage
Terminal=false
Categories=Utilities
EOF

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y


sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16
curl -s http://download.zerotier.com/contact%40zerotier.com.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/zerotier.com.gpg > /dev/null


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

cd /mnt
sudo mkdir md
sudo chown user:user md
cd md
sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 root@70.34.223.123:/root/jekyll/patinas.github.io/_posts/ /mnt/md
cd
echo Done

exit
