# #!/bin/bash
    mkdir -p /var/www/html
    cd /var/www/html
    
    rm -rf *

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root

    mv wp-config-sample.php wp-config.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
    sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
    sed -s "s/localhost/mariadb/g" wp-config.php

    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


    # TODO : fix the connection to the database 


    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
    # echo "WP admin user = $WP_ADMIN"
    # echo "WP password for admin user = $WP_ADMIN_PWD"

    wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author --allow-root
    # echo "WP user created, login=$WP_USER & password=$WP_USER_PWD"
    # echo "Wordpress installed & configured with Mariadb"


     
    # wp theme install astra --activate --allow-root

    mkdir /run/php


    php-fpm7.3 --nodaemonize
    # bash