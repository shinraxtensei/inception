FROM debian:buster

# RUN apt-get update -y && apt-get install vim mariadb mariadb-client mariadb-server -y
RUN apt-get update && apt-get install -y mariadb-server



COPY ./tools/script.sh /


RUN ["/usr/bin/install" , "-m", "755", "-o", "mysql", "-g", "root", "-d", "/var/run/mysqld"]


EXPOSE 3306

# RUN sh ./script.sh



RUN chmod +x ./script.sh

ENTRYPOINT sh ./script.sh