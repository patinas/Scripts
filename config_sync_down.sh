#!/bin/sh

mkdir ~/Sync/
mkdir ~/Scripts/
sudo rm -r ~/Sync/cinnamon_desktop

while true; do ping -c1 www.google.com > /dev/null && break; done
sudo apt update && sudo apt upgrade -y
sudo apt install dconf* -y
sudo apt update && sudo apt upgrade -y

## Sync with google drive
sudo rclone sync -P drive:/Sync/ ~/Sync/ 
sudo rclone sync -P drive:/Scripts/ ~/Scripts/ 

dconf load / < ~/Sync/cinnamon_desktop
