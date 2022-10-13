#!/bin/sh

apt update
# apt systemctl stop systemd-resolved.service


grep -v "nameserver 127.0.0.53" /etc/resolv.conf > tmpfile && mv tmpfile /etc/resolv.conf


tee -a /etc/resolv.conf <<EOF
nameserver 8.8.8.8
EOF

apt update
apt install docker.io -y

tee pihole.sh <<EOF
#!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    -p 8080:8080 \
    -e TZ="Europe/Copenhagen" \
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    thenetworkchuck/networkchuck_pihole

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
EOF

chmod u+x pihole.sh
./pihole.sh

docker exec -it pihole bash
pihole -a -p
