FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget php7.4 php7.4-fpm

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]