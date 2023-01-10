#!/bin/bash

# update package lists
sudo apt update

# install GUI (XFCE in this case)
sudo apt install xfce4 xfce4-goodies -y

# install XRDP package
sudo apt install xrdp -y

# configure XRDP to use XFCE
echo xfce4-session > ~/.xsession
sudo service xrdp restart
