#!/bin/sh
while true; do ping -c1 www.google.com > /dev/null && break; done
sudo apt update && sudo apt upgrade -y
sudo chmod +x joomla_docker.sh
sudo docker pull joomla
sudo docker pull mysql
sudo docker run --name joomla_db -d -e MYSQL_ROOT_PASSWORD=test mysql
sudo docker run --name joomla_website --link joomla_db:mysql -d -p 8080:80 joomla
