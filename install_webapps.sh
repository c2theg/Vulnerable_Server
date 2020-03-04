#!/bin/sh
clear
# Version: 0.0.6
# Updated: 3/3/2020
#---------------------------
# https://docs.docker.com/engine/reference/commandline/run/

#--- Juice Shop --- 
# Docker  --- https://registry.hub.docker.com/r/bkimminich/juice-shop
echo "Juice Shop - https://owasp.org/www-project-juice-shop/ "
docker pull bkimminich/juice-shop
docker run --rm -p 3000:3000 bkimminich/juice-shop
echo "Browse to site: http://<Local IP>:3000 \r\n \r\n"


#--- Hackazon ---  http://cybersecology.com/hackazon-review/ 
echo "Downloading Hackazon...  https://hub.docker.com/r/ianwijaya/hackazon  "
docker pull ianwijaya/hackazon
sudo docker run --name hackazon1 -d -p 8081:3001 ianwijaya/hackazon
echo "Browse to site: http://<Local IP>:3001 \r\n \r\n"


#--- DVWA --- 
echo "DVWA - https://hub.docker.com/r/vulnerables/web-dvwa/ "
docker pull vulnerables/web-dvwa
docker run --rm -it -p 80:3002 vulnerables/web-dvwa
echo "Browse to site: http://<Local IP>:3002 \r\n \r\n"
