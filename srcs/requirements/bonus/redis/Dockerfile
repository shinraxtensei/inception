FROM debian:buster

RUN apt-get update && apt-get install -y redis redis-server vim  php7.3-fpm php-mysql 


RUN sed -i 's/bind 127.0.0.1 ::1/# bind 0.0.0.0 ::1/g' /etc/redis/redis.conf && \
    echo "maxmemory 256mb" >> /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf 

EXPOSE 6379

CMD ["redis-server", "--protected-mode no" ]
