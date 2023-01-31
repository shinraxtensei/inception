# FROM debian:buster

# RUN apt-get update  && apt-get install -y \
#     wget curl vim php7.3 php7.3-fpm php7.3-mysql 


# COPY tools/script.sh /



# ENV MYSQL_DATABASE=ladata
# ENV MYSQL_ROOT_PASSWORD=hamid69
# ENV MYSQL_USER=ahouari
# ENV MYSQL_PASSWORD=ahouari69

# ENV DOMAIN_NAME=ahouari.42.fr
# ENV WP_TITLE="the_almighty_hamid_welcomes_you"

# ENV WP_ADMIN_USR=hamid
# ENV WP_ADMIN_EMAIL=hamid@hamid69.com
# ENV WP_ADMIN_PWD=hamid69

# EXPOSE  9000



# RUN chmod +x ./script.sh

# RUN sh ./script.sh

# ENTRYPOINT ./script.sh
# COPY ./script.sh /docker-entrypoint-initdb.d/


# ****************************************************************************************************


FROM debian:buster

RUN apt-get update  && apt-get install -y \
    wget curl vim php7.3 php7.3-fpm php7.3-mysql 


COPY tools/script.sh /


# ENV MYSQL_DATABASE=wordpress
# ENV MYSQL_ROOT_PASSWORD=rootpassword
# ENV MYSQL_USER=wp
# ENV MYSQL_PASSWORD=wp42

# ENV WP_DBHOST=mariadb

# ENV WP_URL=https://ahouari.42.fr
# ENV WP_TITLE="inception wordpress"
# ENV WP_ADMIN=ahouari
# ENV WP_ADMIN_PWD=ahouari1337
# ENV WP_ADMIN_EMAIL=ahouari@student.1337.ma

# ENV WP_USER=hamid
# ENV WP_USER_EMAIL=hamid@gmail.com
# ENV WP_USER_PWD=hamid69

# ENV HOST_PORT=443
# ENV HOST_MYSQL_PORT=3306
# ENV HOST_WP_PORT=9000


EXPOSE  9000

RUN chmod +x ./script.sh
# RUN sh ./script.sh
ENTRYPOINT ./script.sh