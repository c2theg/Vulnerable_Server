#!/bin/sh
# Version: 0.0.9
# Updated: 4/15/2020
#--------------------------------------------------------------
# https://docs.docker.com/engine/reference/commandline/run/
#
#
#--------------------------------------------------------------

echo "Starting Portainer (9000)... \r\n"
docker run -d --rm -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer &
echo "Browse to Portainer from: https://<Local IP>:9000"


echo "Starting Juice Shop (3000) ... \r\n "
docker run --rm -p 3000:3000 bkimminich/juice-shop &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP> \r\n \r\n"
sleep 10

echo "Starting Hackazon (3001)... \r\n"
docker run --rm -it -p 8081:3001 ianwijaya/hackazon &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:3001 \r\n \r\n"
sleep 5

echo "Starting DVWA (3003)... \r\n"
docker run --rm -it -p 80:3003 vulnerables/web-dvwa &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:3003 \r\n \r\n"
sleep 5

echo "Starting Wordpress (3004)... \r\n"
docker run --rm -it -p 8080:3004 wordpress &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:3004 \r\n \r\n"
sleep 5

echo "Starting Bind DNS  (10000)... \r\n"
docker run --rm -it --dns=127.0.0.1 \
  --publish=53:53/udp --publish 53:53/tcp --publish=10000:10000/tcp \
  --volume=/srv/docker/bind:/data \
  --env='ROOT_PASSWORD=Password123$' \
  sameersbn/bind:latest &
echo "\r\n \r\n"
echo "Browse to Webmin from: https://<Local IP>:10000"


echo "\r\n \r\n"
echo "Cockpit is always avaiable at: http://<LOCAL IP>:9090"
echo "


"
wait
sleep 5
docker ps
