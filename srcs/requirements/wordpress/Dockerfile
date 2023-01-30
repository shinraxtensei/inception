FROM debian:buster

RUN apt-get update  && apt-get install -y \
    wget curl vim php7.3 php7.3-fpm php7.3-mysql 


COPY tools/script.sh /



ENV MYSQL_DATABASE=ladata
ENV MYSQL_ROOT_PASSWORD=hamid69
ENV MYSQL_USER=ahouari
ENV MYSQL_PASSWORD=ahouari69

ENV DOMAIN_NAME=ahouari.42.fr
ENV WP_TITLE="the_almighty_hamid_welcomes_you"

ENV WP_ADMIN_USR=hamid
ENV WP_ADMIN_EMAIL=hamid@hamid69.com
ENV WP_ADMIN_PWD=hamid69


RUN chmod +x ./script.sh
RUN sh ./script.sh