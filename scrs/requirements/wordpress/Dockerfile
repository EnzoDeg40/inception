FROM debian:bullseye

# Récupère les variables d'environnement de Docker Compose
# ENV MARIA_DATABASE=${MARIA_DATABASE}
# ENV MARIA_USER=${MARIA_USER}
# ENV MARIA_PASSWORD=${MARIA_PASSWORD}

ENV MARIA_DATABASE=wp
ENV MARIA_USER=enzo
ENV MARIA_PASSWORD=enzo


RUN apt-get update
RUN apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql default-mysql-client iputils-ping

# Créer le répertoire pour le socket PHP-FPM
RUN mkdir -p /run/php

EXPOSE 9000

RUN mkdir -p /var/www/html

# DL Wordpress # TODO: call a script instead
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm latest.tar.gz

# RUN chown -R www-data:www-data /var/www/html

# copie le fichier de configuration de PHP
RUN cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
RUN sed -i "s/username_here/$MARIA_USER/g" /var/www/html/wp-config.php
RUN sed -i "s/password_here/$MARIA_PASSWORD/g" /var/www/html/wp-config.php
RUN sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php
RUN sed -i "s/database_name_here/$MARIA_DATABASE/g" /var/www/html/wp-config.php

# copie le fichier de configuration de PHP-FPM
COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]