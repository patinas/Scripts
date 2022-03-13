#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker

sudo docker run -d --restart=unless-stopped \
  -p 8080:80 -p 443:443 \
  --privileged \
  rancher/rancher:latest

sudo curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 9f77fc393e977c16

sudo chmod +x portainer.sh

echo Done

exit


