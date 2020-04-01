#!/bin/sh
# Version: 0.0.3
# Updated: 3/31/2020
#---------------------------
echo "Starting Juice Shop... \r\n "
docker run --rm -p 3000:80 bkimminich/juice-shop &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP> \r\n \r\n"


echo "Starting Hackazon... \r\n "
sudo docker run --name hackazon1 -d -p 8081:3001 ianwijaya/hackazon &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:3001 \r\n \r\n"


echo "Starting DVWA... \r\n "
docker run --rm -it -p 80:3002 vulnerables/web-dvwa &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:3002 \r\n \r\n"

echo "Starting Bind DNS... \r\n"
docker run -d --dns=127.0.0.1 \
  --publish=53:53/udp --publish 53:53/tcp --publish=10000:10000/tcp \
  --volume=/srv/docker/bind:/data \
  --env='ROOT_PASSWORD=Password123$' \
  sameersbn/bind:latest &


echo "\r\n \r\n"  
echo "Browse to Webmin from: https://<Local IP>:10000"

echo "\r\n \r\n"
echo "Cockpit is always avaiable at: http://<LOCAL IP>:9090"
echo "\r\n \r\n"

docker ps
