#!/bin/sh

mkdir ~/Scripts/
mkdir ~/Sync/

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

## Remember to connect Google Drive as remote
# sudo apt install rclone -y

## Backup to google drive
sudo rsync -aP --exclude 'google-chrome' ~/.config/ ~/Sync/.config/
sudo rsync -aP ~/.cinnamon/ ~/Sync/.cinnamon/

## Sync with google drive
sudo rclone sync -P ~/Sync/ drive:/Sync/
sudo rclone sync -P ~/Scripts/ drive:/Scripts/

sudo apt update && sudo apt upgrade -y

exit
