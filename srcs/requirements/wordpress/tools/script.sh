#!/bin/bash
    mkdir /var/www/
    mkdir /var/www/html
    cd /var/www/html
    mkdir /run/php

    wget http://wordpress.org/latest.tar.gz 
	tar xfz latest.tar.gz
    rm -rf latest.tar.gz
    mv wordpress /var/www/html/wordpress

    mv var/www/html/wordpress/wp-config-sample.php var/www/html/wordpress/wp-config.php

    sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wordpress/wp-config.php
    sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php

    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root

    # wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    # wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    # wp theme install astra --activate --allow-root


    # service php7.3-fpm start