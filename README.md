# Vulnerable Server / App

1) Install Docker

```
wget https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/install_docker.sh && chmod u+x install_docker.sh && ./install_docker.sh
```

2) Installs:
    * Juice-Shop ( https://owasp.org/www-project-juice-shop/ ) container, runs on http://<Local_IP>:80
    * Hackazon ( http://cybersecology.com/hackazon-review/ ) container, runs on http://<Local_IP>:3001
    * DVWA ( http://www.dvwa.co.uk/ ) container, runs on http://<Local_IP>:3002
    * Bind DNS ( https://hub.docker.com/r/sameersbn/bind ) container (along with Webmin http://<Local_IP>:10000) 
    * Cockpit ( https://cockpit-project.org/ ), on http://<Local_IP>:9090  (For ADMIN and monitoring)

```
wget https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/install_webapps.sh && chmod u+x install_webapps.sh  && ./install_webapps.sh
```

3) Browse to: http://<Local_IP>:300*

<hr>

<h2>PBX</h2>

Some people have asked for PBX (FreePBX). Since not everyone has, I thought I would include it as seperate commands, bellow. I have not testing this as of right now, just wanted to make it available. When i do get a chance, I will update this asap. 

tiredofit/freepbx ( https://hub.docker.com/r/tiredofit/freepbx )

```
docker pull tiredofit/freepbx:latest
```

Start the container: 

```
docker run -d \
  --name freepbx \
  --restart=always \
  --net=host \
  --privileged \
  -v /docker/freepbx/certs:/certs \
  -v /docker/freepbx/www:/www/freepbx \
  -v /docker/freepbx/log:/var/log/ \
  -v /docker/freepbx/data:/data \
  -e DB_EMBEDDED=TRUE \
  tiredofit/freepbx
```
