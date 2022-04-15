#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install rclone -y

rclone config

(crontab -l ; echo "* * * * * rclone sync /home/user/Downloads/ gdrive:/Sync/ >/dev/null 2>&1")| crontab -

chmod +x *.sh
