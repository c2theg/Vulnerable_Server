#!/bin/sh
clear
# Version: 0.0.4
# Updated: 3/3/2020
#---------------------------
#--- Hackazon ---
#echo "Downloading Hackazon...  http://cybersecology.com/hackazon-review/  "
#cd ..
#mkdir hackazon
#cd hackazon/
#git clone --recursive https://github.com/rapid7/hackazon.git

#--- Juice Shop ---
# https://owasp.org/www-project-juice-shop/
#mkdir juiceshop/

#curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
#sudo apt-get install -y nodejs

#git clone https://github.com/bkimminich/juice-shop.git
#cd juice-shop
#npm install
#npm start
#Browse to http://localhost:3000 

#--- Docker version ---
# https://registry.hub.docker.com/r/bkimminich/juice-shop
docker pull bkimminich/juice-shop
docker run --rm -p 3000:3000 bkimminich/juice-shop
