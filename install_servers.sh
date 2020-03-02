#!/bin/sh
clear
# Version: 0.0.9
# Updated: 2/25/2020
#---------------------------
# Software Installed
#PHP 5.6
#MySQL 5.1
#Nginx 1.5

echo "Install Basic software (not servers)... "
sudo apt-get install -y git software-properties-common build-essential 


#-- install PHP 5.5 ---
LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/PHP
sudo apt-get update

sudo apt-get install php5.5
sudo apt-get install -y php5.5-mbstring php5.5-mcrypt php5.5-mysql php5.6-xml php-gd php-xml php-bcmath


#--- Install MySQL ---
#sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu xenial universe'
sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo apt-get update
sudo apt-get install -y mysql-server-5.6 mysql-client-5.6


#--- Requirements for Nginx ---
# PCRE version 4.4 - 8.40
wget https://ftp.pcre.org/pub/pcre/pcre-8.40.tar.gz && tar xzvf pcre-8.40.tar.gz

# zlib version 1.1.3 - 1.2.11
wget http://www.zlib.net/zlib-1.2.11.tar.gz && tar xzvf zlib-1.2.11.tar.gz

# OpenSSL version 1.0.2 - 1.1.0
wget https://www.openssl.org/source/openssl-1.1.0f.tar.gz && tar xzvf openssl-1.1.0f.tar.gz


#--- install Nginx 1.5.11 ---
wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key

# https://www.linuxbabe.com/nginx/nginx-latest-version-ubuntu-16-04-16-10
# https://www.vultr.com/docs/how-to-compile-nginx-from-source-on-ubuntu-16-04

# If you have installed Nginx from Ubuntu software repository, you need to remove it before executing the above two commands.
#sudo apt remove nginx nginx-common nginx-full nginx-core

wget https://nginx.org/download/nginx-1.5.11.tar.gz && tar zxvf nginx-1.5.11.tar.gz

#rm -rf *.tar.gz

# sudo nano /etc/apt/sources.list
# deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx
# deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx

cd ~/nginx-1.5.11
sleep 1

./configure --prefix=/usr/share/nginx \
            --sbin-path=/usr/sbin/nginx \
            --modules-path=/usr/lib/nginx/modules \
            --conf-path=/etc/nginx/nginx.conf \
            --error-log-path=/var/log/nginx/error.log \
            --http-log-path=/var/log/nginx/access.log \
            --pid-path=/run/nginx.pid \
            --lock-path=/var/lock/nginx.lock \
            --user=www-data \
            --group=www-data \
            --build=Ubuntu \
            --http-client-body-temp-path=/var/lib/nginx/body \
            --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
            --http-proxy-temp-path=/var/lib/nginx/proxy \
            --http-scgi-temp-path=/var/lib/nginx/scgi \
            --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
            --with-openssl=../openssl-1.1.0f \
            --with-openssl-opt=enable-ec_nistp_64_gcc_128 \
            --with-openssl-opt=no-nextprotoneg \
            --with-openssl-opt=no-weak-ssl-ciphers \
            --with-openssl-opt=no-ssl3 \
            --with-pcre=../pcre-8.40 \
            --with-pcre-jit \
            --with-zlib=../zlib-1.2.11 \
            --with-compat \
            --with-file-aio \
            --with-threads \
            --with-http_addition_module \
            --with-http_auth_request_module \
            --with-http_dav_module \
            --with-http_flv_module \
            --with-http_gunzip_module \
            --with-http_gzip_static_module \
            --with-http_mp4_module \
            --with-http_random_index_module \
            --with-http_realip_module \
            --with-http_slice_module \
            --with-http_ssl_module \
            --with-http_sub_module \
            --with-http_stub_status_module \
            --with-http_v2_module \
            --with-http_secure_link_module \
            --with-mail \
            --with-mail_ssl_module \
            --with-stream \
            --with-stream_realip_module \
            --with-stream_ssl_module \
            --with-stream_ssl_preread_module \
            --with-debug \
            --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2' \
            --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now'
make 
sudo make install

cd ~
rm -r nginx-1.5.11/ openssl-1.1.0f/ pcre-8.40/ zlib-1.2.11/

sudo nginx -v && sudo nginx -V
sudo nginx -t

echo "Installing Nginx Service....  "
mkdir -p /var/lib/nginx && sudo nginx -t
#sudo vim /etc/systemd/system/nginx.service
wget https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/nginx.service
sudo mv nginx.service /etc/systemd/system/nginx.service
sudo systemctl start nginx.service && sudo systemctl enable nginx.service
sudo systemctl is-enabled nginx.service

echo "Starting nginx... "
sudo systemctl start nginx

echo "sleeping for 5 seconds.."
sleep 5

sudo systemctl status nginx.service
ps aux | grep nginx
curl -I 127.0.0.1

#nginx -v
systemctl status nginx
#*****************************************************************************************************************************************************************
WebsitePath=/var/www/html

#--- DVWA ---
echo "Downloading Damn Vulnerable Web Application (DVWA)   http://www.dvwa.co.uk/  

"
cd $WebsitePath/
mkdir dvwa
cd dvwa/
git clone --recursive https://github.com/ethicalhack3r/DVWA.git

sleep 2
wait
#--- Hackazon ---
echo "Downloading Hackazon...  http://cybersecology.com/hackazon-review/  

"
cd ..
mkdir hackazon
cd hackazon/
git clone --recursive https://github.com/rapid7/hackazon.git

#--- Default home page ---
cd ..
#cd $WebsitePath/
echo "Downloading Nginx Config"
wget -O "nginx_global_filetypes.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_filetypes.conf"
wget -O "nginx_global_logging.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_logging.conf"
wget -O "nginx_global_security.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_security.conf"
wget -O "nginx_global_tls.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_tls.conf"
wget -O "nginx.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx.conf"
#-- sample page --
wget -O "index.html" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/index.html"
wget -O "custom_404.html" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/custom_404.html"
wget -O "custom_50x.html" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/custom_50x.html"
wget -O "nginx.png" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx.png"
wget -O "f5-logo-tagline-right-solid-rgb-1.png" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/f5-logo-tagline-right-solid-rgb-1.png"

#-- Move Files --
sudo mv "nginx_global_filetypes.conf" "/etc/nginx/snippets/nginx_global_filetypes.conf"
sudo mv "nginx_global_logging.conf" "/etc/nginx/snippets/nginx_global_logging.conf"
sudo mv "nginx_global_security.conf" "/etc/nginx/snippets/nginx_global_security.conf"
sudo mv "nginx_global_tls.conf" "/etc/nginx/snippets/nginx_global_tls.conf"
sudo mv "nginx.conf" "/etc/nginx/nginx.conf"
#-- sample page --

sudo mv "index.html" "$WebsitePath/index.html"
sudo mv "custom_404.html" "$WebsitePath/custom_404.html"
sudo mv "custom_50x.html" "$WebsitePath/custom_50x.html"
sudo mv "nginx.png" "$WebsitePath/nginx.png"
sudo mv "f5-logo-tagline-right-solid-rgb-1.png" "$WebsitePath/f5-logo-tagline-right-solid-rgb-1.png"

wait
echo "Nginx Config Download Complete"

echo "Downloading Basic HTTP/HTTPS Website Config"
#wget -O "site1.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/site1.conf"
wget -O "site1_80443.conf" "https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/site1_80_Unsecure.conf"
wait
sudo mv "site1_80443.conf" "/etc/nginx/sites-enabled/site1_80443.conf"
wait
if [ -s "/etc/nginx/sites-enabled/default" ]; then
	echo "Deleting file  nginx default config "
	rm "/etc/nginx/sites-enabled/default"
fi
wait
echo "Basic HTTP/HTTPS Website Config Download Complete"

touch /var/www/html/healthcheck.html
echo "true" > "$WebsitePath/healthcheck.html"

#---------------------------------------------------------------------------------------------------------
sudo chmod -R 755 $WebsitePath/ && sudo chown -R www-data:www-data $WebsitePath/

wait
echo "Restarting Nginx... "
/etc/init.d/nginx restart

echo "Restarting PHP-FPM... "
/etc/init.d/php7.4-fpm restart
echo "Done All! \r\n \r\n"