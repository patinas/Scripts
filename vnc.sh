#!/bin/sh

sudo apt update
sudo apt install lightdm -y
sudo apt install x11vnc -y

sudo cat > /lib/systemd/system/x11vnc.service  <<EOF
[Unit]
Description=x11vnc service
After=display-manager.service network.target syslog.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd root
ExecStop=/usr/bin/killall x11vnc
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF


sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc.service

sudo reboot


