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

sudo echo 'user ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers


sudo apt install qemu-kvm libvirt-daemon-system virtinst libvirt-clients bridge-utils -y
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
sudo tee -a /etc/netplan/00-installer-config.yaml <<EOF
network:
  renderer: NetworkManager
EOF
sudo netplan apply



sudo tailscale ip -4




### For laptop deployment
# sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.old
# sudo tee -a /etc/systemd/logind.conf <<EOF
# HandleLidSwitch=ignore
# LidSwitchIgnoreInhibited=no
# EOF
# sudo service systemd-logind restart
