FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 php7.3-fpm php7.3-mysql  vim curl


RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:8000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    curl -L -o /tmp/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mkdir -p /var/www/html /run/php && cp /tmp/adminer.php /var/www/html/adminer.php


expose 8000

CMD ["php-fpm7.3", "--nodaemonize"]