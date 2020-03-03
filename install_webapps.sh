#!/bin/sh
clear
# Version: 0.0.3
# Updated: 3/3/2020
#---------------------------

#*****************************************************************************************************************************************************************
WebsitePath=/var/www/html


if [ ! -d /var/www/ ]; then
    mkdir /var/www/
fi

if [ ! -d /var/www/html/ ]; then
    mkdir /var/www/html/
fi

cd $WebsitePath/
#--- DVWA ---
#echo "Downloading Damn Vulnerable Web Application (DVWA)   http://www.dvwa.co.uk/  "

#mkdir dvwa
#cd dvwa/
#git clone --recursive https://github.com/ethicalhack3r/DVWA.git
#sleep 2
#wait

#--- Hackazon ---
#echo "Downloading Hackazon...  http://cybersecology.com/hackazon-review/  "
#cd ..
#mkdir hackazon
#cd hackazon/
#git clone --recursive https://github.com/rapid7/hackazon.git

#create database hackazon;
#GRANT ALL ON hackazon.* TO hackazon@'localhost' IDENTIFIED BY 'password';

#--- Juice Shop ---
# https://owasp.org/www-project-juice-shop/
mkdir juiceshop/

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

git clone https://github.com/bkimminich/juice-shop.git
cd juice-shop
npm install
npm start
#Browse to http://localhost:3000 

#-- Docker version
# https://registry.hub.docker.com/r/bkimminich/juice-shop
# docker pull bkimminich/juice-shop
# docker run --rm -p 3000:3000 bkimminich/juice-shop
