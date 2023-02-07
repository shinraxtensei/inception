FROM debian:buster

RUN apt-get update && apt-get install -y vim mariadb-server

COPY ./tools/mydb.sql /


RUN service mysql start;\
    sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
    mysql < mydb.sql;

ENTRYPOINT mysqld_safe
