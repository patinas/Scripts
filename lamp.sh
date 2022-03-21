#!/bin/sh
while true; do ping -c1 www.google.com > /dev/null && break; done
sudo apt update && sudo apt upgrade -y
sudo chmod u+x *.sh
cd ~/

mkdir -p ~/docker/lamp/html
cd ~/docker/lamp

sudo cat > php.Dockerfile <<EOF
FROM php:7.3.3-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
EOF

sudo cat > docker-compose.yaml <<EOF
version: "3.7"
services:
  demo01:
    build:
      dockerfile: php.Dockerfile
      context: .
    restart: always
    volumes:
      - "./html/:/var/www/html/"
    ports:
      - "8080:80"
  demo02:
    build:
      dockerfile: php.Dockerfile
      context: .
    restart: always
    volumes:
      - "./html2/:/var/www/html/"
    ports:
      - "8081:80"
  mysql-server:
    image: mysql:8.0.19
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: app
    volumes:
      - mysql-data:/var/lib/mysql

  phpmyadmin:
    image: phpmyadmin/phpmyadmin:5.0.1
    restart: always
    environment:
      PMA_HOST: mysql-server
      PMA_USER: root
      PMA_PASSWORD: secret
    ports:
      - "5000:80"
  reverse:
    container_name: reverse
    hostname: reverse
    image: nginx
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /root/nginx/:/etc/nginx
      - /root/ssl:/etc/ssl/private
volumes:
  mysql-data:
EOF

docker-compose up -d
