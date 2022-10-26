#!/bin/sh
cd /mnt
sudo mkdir md
sudo chown user:user md
cd md
sshfs root@70.34.223.123:/root/jekyll/patinas.github.io/_posts/ /mnt/md
