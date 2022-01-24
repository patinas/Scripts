#!/bin/sh

mkdir ~/Scripts/
mkdir ~/Sync/

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

## Remember to connect Google Drive as remote
# sudo apt install rclone -y

dconf dump /org/cinnamon/ > cinnamon.dconf
dconf dump /org/nemo/ > nemo.dconf
dconf dump /org/gtk/ > gtk.dconf
dconf dump /org/gnome/ > gnome.dconf

sudo mv cinnamon.dconf ~
sudo mv nemo.dconf ~
sudo mv gtk.dconf ~
sudo mv gnome.dconf ~

## Backup to google drive
sudo rsync -aP ~/cinnamon.dconf  ~/Sync/
sudo rsync -aP ~/nemo.dconf  ~/Sync/
sudo rsync -aP ~/gtk.dconf  ~/Sync/
sudo rsync -aP ~/gnome.dconf  ~/Sync/

## Backup to google drive
# sudo rsync -aP --exclude 'google-chrome' ~/.config/ ~/Sync/.config/
# sudo rsync -aP ~/.cinnamon/ ~/Sync/.cinnamon/

## Sync with google drive
sudo rclone sync -P ~/Sync/ drive:/Sync/
sudo rclone sync -P ~/Scripts/ drive:/Scripts/

sudo apt update && sudo apt upgrade -y

exit
