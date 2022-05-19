#!/bin/bash

cp /home/user/.config/awesome/rc.lua /root/scripts/
cp -r /home/user/.config/alacritty /root/scripts/


cd /root/scripts/
sudo chmod +x *.sh
gstatus=`git status --porcelain`

if [ ${#gstatus} -ne 0 ]
then
	git pull
    git add .
    git commit -q -m "$gstatus"
    git push -q

fi
