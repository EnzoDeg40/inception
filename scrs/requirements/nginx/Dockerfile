FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default

# Ajoute le certificat
RUN mkdir /etc/nginx/certs
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/certs/server.key -x509 -days 365 -out /etc/nginx/certs/server.crt -subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42 Paris/CN=edegraev.42.fr/emailAddress=edegraev@student.42.fr"

EXPOSE 8080

# Démarre Nginx
CMD ["nginx", "-g", "daemon off;"]
