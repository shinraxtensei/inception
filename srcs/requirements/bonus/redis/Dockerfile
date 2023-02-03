FROM debian:buster

RUN apt-get update && apt-get install -y redis-server vim  

RUN sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf &&\
    sed -i 's/bind 127.0.0.1 ::1/# bind 127.0.0.1 ::1/g' /etc/redis/redis.conf && \
    echo "maxmemory 256mb" >> /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf 
    # echo "never" > /sys/kernel/mm/transparent_hugepage/enabled'
    # echo "vm.overcommit_memory = 1" >> /etc/redis/redis.conf

# TODO : comment the bind address in the redis config file to allow connections from outside the container\
# TODO : disable the protected mode in the redis config file to allow connections from outside the container

EXPOSE 6379


ENTRYPOINT ["redis-server" , "/etc/redis/redis.conf"]
