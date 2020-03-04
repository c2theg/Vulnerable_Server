# Vulnerable Server / App

1) Install Docker

```
wget https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/install_docker.sh && chmod u+x install_docker.sh && ./install_docker.sh
```

2) Installs:
    a) Juice-Shop ( https://owasp.org/www-project-juice-shop/ ) container, runs on http://<Local_IP>:3000
    b) Hackazon ( http://cybersecology.com/hackazon-review/ ) container, runs on http://<Local_IP>:3001
    c) DVWA ( http://www.dvwa.co.uk/ ) container, runns on http://<Local_IP>:3002

```
wget https://raw.githubusercontent.com/c2theg/Vulnerable_Server/master/install_webapps.sh && chmod u+x install_webapps.sh  && ./install_webapps.sh
```

3) Browse to: http://<Local_IP>:3000 - 3002
