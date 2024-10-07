FROM debian:latest

RUN apt-get update
RUN apt-get install -y wget php8.2 php8.2-fpm

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]