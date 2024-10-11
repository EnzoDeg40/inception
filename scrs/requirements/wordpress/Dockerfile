FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget php7.4 php7.4-fpm

# Créer le répertoire pour le socket PHP-FPM
RUN mkdir -p /run/php

EXPOSE 9000

# JUST FOR TESTING
RUN mkdir -p /var/www/html
COPY ./requirements/wordpress/conf/index.php /var/www/html/index.php

# copie le fichier de configuration de PHP-FPM
COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]