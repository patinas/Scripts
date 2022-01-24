#!/bin/sh

mkdir ~/Scripts/
mkdir ~/Sync/

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

## Remember to connect Google Drive as remote
# sudo apt install rclone -y

## Sync with google drive
sudo rclone sync -P drive:/Sync/ ~/Sync/
sudo rclone sync -P drive:/Scripts/ ~/Scripts/

## Download new config
# sudo rm -rf ~/.config/
# sudo rm -rf ~/.cinnamon/
sudo rsync -aPv ~/Sync/.config/ ~/.config/
sudo rsync -aPv ~/Sync/.cinnamon/ ~/.cinnamon/

sudo apt update && sudo apt upgrade -y

exit
