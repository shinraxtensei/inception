FROM debian:buster

RUN apt-get update  && apt-get install -y \
    wget curl vim php7.3 php7.3-fpm php7.3-mysql 

COPY tools/script.sh /



RUN chmod +x ./script.sh

ENTRYPOINT ./script.sh