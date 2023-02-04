FROM debian:buster

RUN apt-get update && apt-get install -y nodejs npm 

WORKDIR /app

COPY app.js .
COPY index.html .

CMD ["node", "app.js"]

# FROM debian:buster

# RUN apt update -y; apt upgrade -y; apt install apache2 -y;\
#      sed -i  's/80/69/g' /etc/apache2/ports.conf;

# COPY ./site ./var/www/html

# CMD ["apachectl", "-D", "FOREGROUND"]