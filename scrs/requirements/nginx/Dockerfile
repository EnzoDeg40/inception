FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx

# COPY requirements/nginx/conf/a.html /var/www/html/a.html

EXPOSE 80

# Démarre Nginx
CMD ["nginx", "-g", "daemon off;"]