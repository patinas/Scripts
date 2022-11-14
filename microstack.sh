#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

sudo curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey tskey-auth-kmYWEs4CNTRL-E58dqRPnpjitN4wH1JYshiDnogxNZCqR

sudo chmod +x *.sh

curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y

sudo apt update && sudo apt upgrade -y

# sudo tee -a "file" <<EOF
#
# EOF

sudo snap install microstack --devmode --edge
# Control Node
sudo microstack init --auto --control
# To get connection-string
sudo microstack add-compute

# Compute node
sudo microstack init --auto --compute --join <connection-string>



sudo tailscale ip -4

echo Done

exit
