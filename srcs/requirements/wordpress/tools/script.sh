# #!/bin/bash
    mkdir -p /var/www/html
    cd /var/www/html
    
    # rm -rf *

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root

    # wget http://wordpress.org/latest.tar.gz 
	# tar xfz latest.tar.gz
    # rm -rf latest.tar.gz
    # mv wordpress /var/www/html/wordpress

    mv wp-config-sample.php wp-config.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
    sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
    sed -s "s/localhost/$WP_DBHOST/g" wp-config.php

    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


    # TODO : fix the connection to the database 


    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
    echo "WP admin user = $WP_ADMIN"
    echo "WP password for admin user = $WP_ADMIN_PWD"

    wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author --allow-root
    echo "WP user created, login=$WP_USER & password=$WP_USER_PWD"

     echo "Wordpress installed & configured with Mariadb"


     
    # wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    # wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    # wp theme install astra --activate --allow-root

    mkdir /run/php

    # service php7.3-fpm start
    # /usr/sbin/php-fpm7.3 -F

    php-fpm7.3 --nodaemonize
    # bash