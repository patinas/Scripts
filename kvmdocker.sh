#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

sudo curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey tskey-auth-kmYWEs4CNTRL-E58dqRPnpjitN4wH1JYshiDnogxNZCqR

curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y

# sudo tee -a /etc/ssh/sshd_config <<EOF
# HostKeyAlgorithms +ssh-rsa
# EOF
# sudo service ssh restart

sudo apt install timeshift -y
# sudo timeshift --list-devices
# sudo timeshift --create --comments "FRESH" --snapshot-device /dev/dm-0
# sudo timeshift --restore

sudo echo 'user ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

sudo tailscale ip -4


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
      DATA_DIR: "/kvmdata"
    ports:
      - 80:8080
    volumes:
      - /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock:ro
      - "/kvmdata:/kvmdata"
EOF

cd ~/windows-in-docker/
docker-compose up -d

# Configuration
# Edit the docker-compose.yml file, change the volumes: section to map the directory you want.
# Eg.: I'm sharing the /mnt/hdd_repo/Shared/ Docker host directory as the Samba path. You can change it to anything you have on the host:
# volumes:
#   - /home/someone/my_folder/:/Shared
# If you want to perform Samba related configurations, just edit the smb.conf file to fit your wishes.
git clone https://github.com/fschuindt/docker-smb.git
cd ~/docker-smb

sudo tee docker-compose.yml <<EOF
version: '3'

services:
  samba:
    tty: true
    network_mode: bridge
    volumes:
      - /root/Shared/:/Shared
    ports:
      - "139:139"
      - "445:445"
    build:
      context: .
      dockerfile: Dockerfile
EOF

docker-compose build
docker-compose up -d


### For laptop deployment
# sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.old
# sudo tee -a /etc/systemd/logind.conf <<EOF
# HandleLidSwitch=ignore
# LidSwitchIgnoreInhibited=no
# EOF
# sudo service systemd-logind restart
