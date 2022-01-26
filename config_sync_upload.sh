#!/bin/sh

mkdir ~/Sync/
mkdir ~/Scripts/

while true; do ping -c1 www.google.com > /dev/null && break; done
sudo apt update && sudo apt upgrade -y
sudo apt install dconf* -y
sudo apt update && sudo apt upgrade -y

## Backup settings
dconf dump / > cinnamon_desktop
mv cinnamon_desktop ~/Sync/

## Sync with google drive
sudo rclone sync -P ~/Sync/ drive:/Sync/ --delete-before
sudo rclone sync -P ~/Scripts/ drive:/Scripts/ --delete-before
