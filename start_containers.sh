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


echo "Starting Juice Shop (80) ... \r\n "
docker run --rm -p 80:3000 bkimminich/juice-shop &
echo "


"
echo "Browse to site: http://<Local IP>  PLEASE WAIT up to 15seconds before the server is ready \r\n \r\n"
wait
sleep 5


echo "Starting DVWA (81)... \r\n"
docker run --rm -it -p 81:80 vulnerables/web-dvwa &
echo "


"
echo "Browse to site: http://<Local IP>:81 \r\n \r\n"
wait
sleep 5


echo "Starting Wordpress (82)... \r\n"
docker run --rm -p 82:80 wordpress &
echo "


"
echo "Browse to site: http://<Local IP>:82 \r\n \r\n"
sleep 5

echo "Starting Hackazon (8081)... \r\n"
docker run --rm -p 8081:80 ianwijaya/hackazon &
echo "


"
echo "Browse to site: http://<Local IP>:8081 \r\n \r\n"
sleep 5


echo "Starting Bind DNS  (10000)... \r\n"
docker run -d --restart=always \
  --publish 853:53/tcp --publish 853:53/udp --publish 10000:10000/tcp \
  --volume /srv/docker/bind:/data \
  --env='ROOT_PASSWORD=Password123$' \
  sameersbn/bind:latest
 
echo "


"
echo "Browse to Webmin from: https://<Local IP>:10000  Login: root / Password123$ "
echo "


"
echo "Cockpit is always avaiable at: http://<LOCAL IP>:9090"
echo "


"
wait
sleep 5
docker ps
