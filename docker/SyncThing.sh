#!/bin/sh

sudo docker run -d \
  --name=syncthing \
  --hostname=syncthing `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Copenhagen \
  -p 8384:8384 \
  -p 22000:22000/tcp \
  -p 22000:22000/udp \
  -p 21027:21027/udp \
  -v /root/syncthing/config:/config \
  -v /root/syncthing/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/syncthing
