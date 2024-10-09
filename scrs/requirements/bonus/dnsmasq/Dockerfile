FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y dnsmasq dnsutils

# Copie du fichier de configuration
COPY ./requirements/bonus/dnsmasq/dnsmasq.conf /etc/dnsmasq.conf
COPY ./requirements/bonus/dnsmasq/dnsmasq.conf /etc/dnsmasq.conf

# Exposition du port DNS
EXPOSE 53/udp
EXPOSE 53/tcp

# Commande de démarrage
CMD ["dnsmasq", "-k"]
