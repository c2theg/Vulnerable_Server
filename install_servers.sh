#!/bin/sh
clear
# Version: 0.0.8
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
sudo apt-get install -y php5.5-mbstring php5.5-mcrypt php5.5-mysql php5.6-xml php-gd


#--- Install MySQL ---
#sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu xenial universe'
sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo apt-get update
sudo apt-get install -y mysql-server-5.6 mysql-client-5.6


#-- install nginx 1.5.11
 # https://www.linuxbabe.com/nginx/nginx-latest-version-ubuntu-16-04-16-10

# If you have installed Nginx from Ubuntu software repository, you need to remove it before executing the above two commands.
#sudo apt remove nginx nginx-common nginx-full nginx-core

wget https://nginx.org/download/nginx-1.5.11.tar.gz && tar zxvf nginx-1.5.11.tar.gz

# sudo nano /etc/apt/sources.list
# deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx
# deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx

wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key

#sudo apt update
#sudo apt install nginx

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


echo "Starting nginx... "

sudo systemctl start nginx

echo "sleeping for 5 seconds.."
sleep 5


nginx -v
systemctl status nginx



#*****************************************************************************************************************************************************************

#--- DVWA ---
echo "Downloading Damn Vulnerable Web Application (DVWA)   http://www.dvwa.co.uk/  

"
cd /var/www/html/
mkdir dvwa
cd dvwa/
git clone --recursive https://github.com/ethicalhack3r/DVWA.git


#--- Hackazon ---
