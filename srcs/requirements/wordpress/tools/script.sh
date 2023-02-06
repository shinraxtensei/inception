# #!/bin/bash
    mkdir -p /var/www/html
    mkdir /run/php
    # chmod 777 /var/www/html

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --path=/var/www/html --allow-root

    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf 

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WP_DBHOST --path=/var/www/html --allow-root --skip-check --extra-php <<PHP

define( 'WP_REDIS_DATABASE', 0 );
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_REDIS_DISABLED', false);
define( 'WP_REDIS_TIMEOUT', 1 );

PHP


wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL"  --path=/var/www/html --skip-email
wp user create wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author  --path=/var/www/html --allow-root




wp plugin install redis-cache --activate  --path=/var/www/html --allow-root

wp plugin update --all  --path=/var/www/html --allow-root

wp redis enable --path=/var/www/html --allow-root

 cat /var/www/html/wp-config.php

    php-fpm7.3 --nodaemonize
