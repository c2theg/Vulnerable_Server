#!/bin/sh
# Version: 0.0.8
# Updated: 4/15/2020
#---------------------------
echo "Starting Portainer (9000)... \r\n"
docker run -d --rm -it -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer &
echo "Browse to Portainer from: https://<Local IP>:9000"


echo "Starting Juice Shop (80) ... \r\n "
docker run -d --rm -it -p 3000:80 bkimminich/juice-shop &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP> \r\n \r\n"


echo "Starting Hackazon (81)... \r\n"
docker run -d --rm -it -p 8081:81 ianwijaya/hackazon &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:81 \r\n \r\n"


echo "Starting DVWA (82)... \r\n"
docker run -d --rm -it -p 80:82 vulnerables/web-dvwa &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:82 \r\n \r\n"


echo "Starting Wordpress (83)... \r\n"
docker run -d --rm -it -p 8080:83 wordpress &
echo "\r\n \r\n"
echo "Browse to site: http://<Local IP>:83 \r\n \r\n"


echo "Starting Bind DNS  (10000)... \r\n"
docker run -d --rm -it --dns=127.0.0.1 \
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
