#!/bin/sh

adduser rdpuser
u sermod -aG sudo rdpuser
apt-get update
apt-get install xrdp
systemctl start xrdp
systemctl start xrdp-sesman
systemctl enable xrdp
systemctl enable xrdp-sesman
