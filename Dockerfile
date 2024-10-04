FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx

COPY ./html /usr/share/nginx/html

EXPOSE 80

# Démarre Nginx
CMD ["nginx", "-g", "daemon off;"]
