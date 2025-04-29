# Utilise Debian comme base
FROM debian:latest

# Éviter les prompts pendant l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Installer Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copier les fichiers de ton site dans le dossier web Apache
COPY ./html/ /var/www/html/

# Exposer le port 80
EXPOSE 80

# Lancer Apache au démarrage
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
