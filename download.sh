#!/bin/sh
cd /root/
rm -r /root/scripts
git clone git@github.com:patinas/scripts.git
cp /root/scripts/rc.lua /home/user/.config/awesome/
cp -r /root/scripts/alacritty /home/user/.config/ 
