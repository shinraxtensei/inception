FROM debian:buster

# RUN apt-get update -y && apt-get install vim mariadb mariadb-client mariadb-server -y
RUN apt-get update && apt-get install -y vim mariadb-server



COPY ./tools/script.sh /
COPY ./tools/mydb.sql /
# RUN ["/usr/bin/install" , "-m", "755", "-o", "mysql", "-g", "root", "-d", "/var/run/mysqld"]


EXPOSE 3306

# RUN sh ./script.sh



# ENV MYSQL_DATABASE=wordpress
# ENV MYSQL_ROOT_PASSWORD=root69
# ENV MYSQL_USER=hamid
# ENV MYSQL_PASSWORD=hamid
# ENV WP_DBHOST=mariadb/
# ENV WP_URL=https://ahouari.42.fr
# ENV WP_TITLE="inception wordpress"
# ENV WP_ADMIN=hamid
# ENV WP_ADMIN_PWD=hamid69
# ENV WP_ADMIN_EMAIL=hamid@hamid.com
# ENV WP_USER=ahouari
# ENV WP_USER_EMAIL=ahouari1337@gmail.com
# ENV WP_USER_PWD=ahouari@student.1337.ma
# ENV HOST_PORT=443
# ENV HOST_MYSQL_PORT=3306
# ENV HOST_WP_PORT=9000


# RUN chmod +x ./script.sh
# RUN ./script.sh


RUN sed -i "s/bind-address.*/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf && \
    service mysql start && \
    mysql < /mydb.sql



ENTRYPOINT mysqld_safe
# ENTRYPOINT sh ./script.sh



