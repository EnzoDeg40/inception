FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default
COPY requirements/nginx/conf/index.html /var/www/html/index.html

# mkdir -p requirements/nginx/certs
# openssl req -newkey rsa:2048 -nodes -keyout server.key -x509 -days 365 -out server.crt

# Ajoute le certificat
COPY ./requirements/nginx/certs/server.crt /etc/nginx/certs/server.crt  
# Ajoute la clé
COPY ./requirements/nginx/certs/server.key /etc/nginx/certs/server.key 

EXPOSE 8080

# Démarre Nginx
CMD ["nginx", "-g", "daemon off;"]
