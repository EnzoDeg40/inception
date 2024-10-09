FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default
COPY requirements/nginx/conf/index.html /var/www/html/index.html


EXPOSE 8080

# Démarre Nginx
CMD ["nginx", "-g", "daemon off;"]