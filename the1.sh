#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y
sudo apt install curl -y
sudo apt install remmina -y

cd ~/Downloads
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm google-chrome-stable_current_amd64.deb

sudo apt install openssh-server -y
sudo apt install peek -y
sudo apt install variety -y
sudo apt install flatpak -y
sudo flatpak install https://flatpak.elementary.io/repo/appstream/com.github.phase1geo.annotator.flatpakref -y
sudo apt install snapd -y

# sudo apt install gnome-tweaks -y

sudo curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y


sudo chmod +x *.sh

# sudo echo 'user ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

cd /home/user/Downloads
wget https://github.com/leukipp/cortile/releases/download/v2.2.2/cortile_2.2.2_linux_amd64.tar.gz
# extract cortile from the tar.gz archive
tar -xvf cortile_*_linux_amd64.tar.gz
# execute the binary file
./cortile

# Specify the script and its location
SCRIPT_NAME="cortile"
SCRIPT_PATH="$HOME/Downloads/$SCRIPT_NAME"

# Create the desktop entry
echo "[Desktop Entry]
Type=Application
Name=Cortile
Exec=$SCRIPT_PATH" > "$HOME/.config/autostart/cortile.desktop"

# Make the script executable
chmod +x "$SCRIPT_PATH"

echo "Cortile script added to autostart and made executable."

sudo apt install xdotool

# Set keyboard shortcuts using xfconf-query

# Close Window (Alt+Q)
xfconf-query --create -c xfwm4 -p "/commands/custom/<Alt>q" -t string -s "xdotool getactivewindow windowclose"

# Launch xfce4-appfinder (Super)
xfconf-query --create -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_L" -t string -s "xfce4-appfinder"

# Terminal (Alt+Enter)
xfconf-query --create -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>Return" -t string -s "xfce4-terminal"

# Launch Browser (Alt+W)
xfconf-query --create -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>w" -t string -s "google-chrome"

echo "Keyboard shortcuts set."



exit
