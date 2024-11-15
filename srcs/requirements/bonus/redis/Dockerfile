FROM debian:bullseye

RUN apt-get -y update && apt install redis-server -y

# configure redis
RUN echo "maxmemory 512mb" >> /etc/redis/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
RUN sed -i -r "s/bind 127.0.0.1/#bind 0.0.0.0/" /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]