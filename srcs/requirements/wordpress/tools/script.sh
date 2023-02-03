# #!/bin/bash
    mkdir -p /var/www/html
    cd /var/www/html
    
    rm -rf *
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root

    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf 
    # mv wp-config-sample.php wp-config.php
    # sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
    # sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
    # sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
    # sed -i "s/localhost/$WP_DBHOST/g" wp-config.php


    


wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WP_DBHOST --allow-root --skip-check --extra-php <<PHP
    define('WP_REDIS_HOST', 'redis');
    define( 'WP_REDIS_HOST', '127.0.0.0' );
    define('WP_REDIS_PORT', 6379);
    define('WP_REDIS_DISABLED', false);
    define( 'WP_REDIS_TIMEOUT', 1 );
    define( 'WP_REDIS_READ_TIMEOUT', 1 );
    define( 'WP_REDIS_DATABASE', 0 );
PHP



    wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
    wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author --allow-root

    service php7.3-fpm start

    wp plugin install redis-cache --activate  --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root
    
    service php7.3-fpm stop
    mkdir /run/php

    php-fpm7.3 --nodaemonize
