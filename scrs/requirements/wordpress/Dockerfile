FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql

# Créer le répertoire pour le socket PHP-FPM
RUN mkdir -p /run/php

EXPOSE 9000

RUN mkdir -p /var/www/html

# DL Wordpress # TODO: call a script instead
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm latest.tar.gz


# copie le fichier de configuration de PHP-FPM
COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]