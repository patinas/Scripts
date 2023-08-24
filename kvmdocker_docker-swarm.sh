#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker

sudo echo 'user ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

sudo apt install -y -- libvirt-daemon-system
sudo apt install git -y

cd
git clone https://github.com/ms-jpq/windows-in-docker

sudo tee ~/windows-in-docker/docker-compose.yml <<EOF
---
version: "3.9"

services:
  libvirt:
    restart: always
    image: msjpq/windows-in-docker:latest
    security_opt:
      - apparmor=unconfined
    environment:
      TZ:
      # Make sure DATA_DIR is the same across the three `${DATA_DIR}`s
      # The windows drivers are also downloaded under here.
      DATA_DIR: "/root/glusterfs/kvm"
    deploy:
      mode: global
    ports:
      - 80:8080
    volumes:
      - /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock:ro
      - "/root/glusterfs/kvm:/kvmdata"
EOF

cd ~/windows-in-docker/
docker stack deploy -c docker-compose.yml windows_in_docker
