FROM debian:buster


RUN apt-get update && apt-get install -y vim mariadb-server



COPY ./tools/script.sh /
COPY ./tools/mydb.sql /


EXPOSE 3306


RUN service mysql start;\
    chown -R mysql:mysql /var/lib/mysql;\
    sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
    sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
    chmod 777 /var/run/mysqld;\
    mysql < mydb.sql;

RUN chmod 777 /script.sh

ENTRYPOINT mysqld_safe
