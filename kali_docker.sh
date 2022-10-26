mkdir ~/kali
cd ~/kali

tee docker-compose.yml <<EOF
version: '3.3'
services:
    core-kali-rolling:
        ports:
            - '6901:6901'
        environment:
            - VNC_PW=root
        labels:
            - traefik.enable=true
            - traefik.http.routers.kali.rule=Host(`kali.sudoer.ga`)
            - traefik.http.routers.kali.entrypoints=web
        image: 'kasmweb/core-kali-rolling:1.11.0'
EOF

docker-compose up -d
