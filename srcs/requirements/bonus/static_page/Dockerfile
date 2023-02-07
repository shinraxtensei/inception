FROM debian:buster

RUN apt update -y && apt upgrade -y &&\
    apt install -y nginx



COPY nginx.conf /etc/nginx/conf.d
COPY index.html /var/www/html
COPY me.gif /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]