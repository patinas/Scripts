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

## Restore from google drive
sudo rsync -aP ~/Sync/ ~/cinnamon.dconf  
sudo rsync -aP ~/Sync/ ~/nemo.dconf  
sudo rsync -aP ~/Sync/ ~/gtk.dconf  
sudo rsync -aP ~/Sync/ ~/gnome.dconf

dconf dump /org/cinnamon/ < cinnamon.dconf
dconf dump /org/nemo/ < nemo.dconf
dconf dump /org/gtk/ < gtk.dconf
dconf dump /org/gnome/ < gnome.dconf

## Backup to google drive
# sudo rsync -aP --exclude 'google-chrome' ~/.config/ ~/Sync/.config/
# sudo rsync -aP ~/.cinnamon/ ~/Sync/.cinnamon/

sudo apt update && sudo apt upgrade -y

exit
