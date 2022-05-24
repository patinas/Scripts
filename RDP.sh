#!/bin/sh

adduser rdpuser
usermod -aG sudo rdpuser
apt-get update
apt-get install xrdp
systemctl start xrdp
systemctl start xrdp-sesman
systemctl enable xrdp
systemctl enable xrdp-sesman
