FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx

# COPY ./srcs/requirements/nginx/conf/index.html /home/enzo/data/wordpress

EXPOSE 80

# Démarre Nginx
CMD ["nginx", "-g", "daemon off;"]
