FROM debian:buster

RUN apt update -y && apt upgrade -y &&\
    apt install -y nginx && apt install -y openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=MA/ST=ifrane/L=khouribga/O=1337/OU=student/CN=ahouari.1337.ma"

Expose 443

COPY ./conf/nginx.conf /etc/nginx/conf.d

# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]