#!/bin/sh

mkdir -P /root/flame

cat <<EOF > /root/flame/docker-compose.yml
version: '3.6'

services:
  flame:
    image: pawelmalak/flame
    labels:
      - traefik.enable=true
      - traefik.http.routers.flame.rule=Host(`my.theitguide.xyz`)
      - traefik.http.routers.flame.entrypoints=web
    container_name: flame
    volumes:
      - /root/flame/data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock # optional but required for Docker integration
    restart: always
EOF
