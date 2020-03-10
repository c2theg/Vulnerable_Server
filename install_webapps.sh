#!/bin/sh
clear
# Version: 0.0.9
# Updated: 3/5/2020
#---------------------------
# https://docs.docker.com/engine/reference/commandline/run/

echo "Installing all docker containers! "

#--- Juice Shop --- 
# Docker  --- https://registry.hub.docker.com/r/bkimminich/juice-shop
echo "Juice Shop - https://owasp.org/www-project-juice-shop/ "
docker pull bkimminich/juice-shop
docker run --rm -p 3000:80 bkimminich/juice-shop &
echo "Browse to site: http://<Local IP>:3000 \r\n \r\n"


#--- Hackazon ---  http://cybersecology.com/hackazon-review/ 
echo "Downloading Hackazon...  https://hub.docker.com/r/ianwijaya/hackazon  "
docker pull ianwijaya/hackazon
sudo docker run --name hackazon1 -d -p 8081:3001 ianwijaya/hackazon &
echo "Browse to site: http://<Local IP>:3001 \r\n \r\n"


#--- DVWA --- 
echo "DVWA - https://hub.docker.com/r/vulnerables/web-dvwa/ "
docker pull vulnerables/web-dvwa
docker run --rm -it -p 80:3002 vulnerables/web-dvwa &
echo "Browse to site: http://<Local IP>:3002 \r\n \r\n"

#--- Bind DNS --- http://www.damagehead.com/blog/2015/04/28/deploying-a-dns-server-using-docker/
echo "Bind DNS - https://hub.docker.com/r/sameersbn/bind "
docker pull sameersbn/bind:latest
docker run -d --dns=127.0.0.1 \
  --publish=53:53/udp --publish 53:53/tcp --publish=10000:10000/tcp \
  --volume=/srv/docker/bind:/data \
  --env='ROOT_PASSWORD=Password123$' \
  sameersbn/bind:latest &

echo "You can access Webmin from: https://<Local IP>:10000"

#-- Portainer.io  https://www.portainer.io/ ---
docker pull portainer/portainer
#docker run -d -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer


#--- Cockpit ---
#- give cockpit access to docker api
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
#----------------
sudo -E apt-get -y install cockpit cockpit-docker
sudo systemctl start cockpit
sudo systemctl enable cockpit
echo "Browse (with Firefox) to: http://<LOCAL IP>:9090 "



sudo -E apt-get -y iproute2
#--- General Docker Commands ---
# List Containers:
#   docker ps

# Start container:
#   docker run ...

# Stop container:
#   docker stop <Container ID>

# list container images
#   docker images

# Remove container image:
#   docker image rm <Container ID> -f

