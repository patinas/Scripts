#!/bin/sh
cd /root/
sudo apt update
sudo apt install rustc cargo libasound2-dev libssl-dev pkg-config
git clone https://github.com/Spotifyd/spotifyd.git
cd spotifyd
cargo build --release
cp /root/other_scripts/spotifyd/contrib/spotifyd.service /etc/systemd/user/
systemctl --user start spotifyd.service
systemctl --user enable spotifyd.service
./target/release/spotifyd
