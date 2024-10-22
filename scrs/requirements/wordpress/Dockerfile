FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql php7.4-cli php7.4-redis

# chatgpt suggest:
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     wget \
#     php7.4 \
#     php7.4-fpm \
#     php7.4-mysql \
#     php7.4-cli \
#     mariadb-client \
#  && rm -rf /var/lib/apt/lists/*

# create the directory for the PHP-FPM socket and for wordpress installation
RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

EXPOSE 9000

# download Wordpress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm latest.tar.gz

# install wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# download adminer
RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

# copie le fichier de configuration de PHP-FPM
COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copie le script d'installation de Wordpress
COPY ./requirements/wordpress/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
ENTRYPOINT ["/bin/bash", "/tmp/setup.sh"]

CMD ["php-fpm7.4", "-F"]