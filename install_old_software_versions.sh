#!/bin/sh
clear
# Version: 0.0.10
# Updated: 2/25/2020
#---------------------------
# Software Installed
#PHP 5.6
#MySQL 5.1
#Nginx 1.5

echo "Install Basic software (not servers)... "
sudo apt-get install -y git software-properties-common build-essential libpcre3 libpcre3-dev checkinstall zlib1g-dev -y


#-- install PHP 5.5 ---
#LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get -y install php5.6 php5.6-mbstring php5.6-mcrypt php5.6-xml php5.6-bcmath php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-zip

# Remove Apache2


#--- Install MySQL ---
#sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu xenial universe'
sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo apt-get update
sudo apt-get install -y mysql-server-5.6 mysql-client-5.6

sudo apt-get install -y nginx nginx-common nginx-core fcgiwrap

#Nginx_Version='1.14.2'

# wget https://nginx.org/download/nginx-1.14.2.tar.gz && tar zxvf nginx-1.14.2.tar.gz
#get https://nginx.org/download/nginx-$Nginx_Version.tar.gz && tar zxvf nginx-$Nginx_Version.tar.gz

# sudo nano /etc/apt/sources.list
# deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx
# deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx

#cd nginx-$Nginx_Version/
#sleep 1


#./configure --sbin-path=/usr/local/nginx/nginx \
#    --conf-path=/usr/local/nginx/nginx.conf \
#    --pid-path=/usr/local/nginx/nginx.pid \
#    --with-pcre=../pcre-8.40 \
#    --with-zlib=../zlib-1.2.11 \
#    --with-http_ssl_module \
#    --with-http_secure_link_module

echo "Installing Nginx... "
#make && sudo make install

#cd ~
#rm -r nginx-$Nginx_Version/ openssl-1.1.0f/ pcre-8.40/ zlib-1.2.11/

#sudo nginx -v && sudo nginx -V

#echo "Installing Nginx Service....  "
#mkdir -p /var/lib/nginx && sudo nginx -t
#sudo vim /etc/systemd/system/nginx.service
#wget https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/nginx.service
#sudo mv nginx.service /etc/systemd/system/nginx.service
#sudo systemctl start nginx.service && sudo systemctl enable nginx.service
#sudo systemctl is-enabled nginx.service

#echo "Starting nginx... "
#sudo systemctl start nginx

#echo "sleeping for 5 seconds.."
#sleep 5

sudo systemctl status nginx.service
ps aux | grep nginx
curl -I 127.0.0.1
