#!/bin/sh
cd /root/
apt update
apt install rustc cargo libasound2-dev libssl-dev pkg-config -y
git clone https://github.com/Spotifyd/spotifyd.git
cd spotifyd
cargo build --release
./target/release/spotifyd
