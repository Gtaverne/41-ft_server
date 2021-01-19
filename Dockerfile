FROM debian:buster

MAINTAINER gtaverne

LABEL Creator: "gtav"

RUN apt-get update -y && apt-get install -y \
		wget \
		nginx \
		openssl \
		mariadb-server \
		mariadb-client


# PHP
RUN apt-get install -y \
	php7.3 \
	php7.3-mysql \
	php7.3-fpm \
	php7.3-curl \
	php7.3-gd \
	php7.3-intl \
	php7.3-mbstring \
	php7.3-soap \
	php7.3-xml \
	php7.3-xmlrpc \
	php7.3-zip

#To enable auto-index by default
ENV auto-index=on

#Onboard in the container all the useful sources
COPY srcs/nginx_conf .
COPY srcs/run.sh .
COPY srcs/config.inc.php .
COPY srcs/wp-config.php .
CMD bash run.sh && bash


# Mariadb

#Useful commands

#to remove an old image
#docker rmi -f my_image

#to build the image
#docker build -t ftserverimage
#to start my container once the image is built
#docker run --rm --name my_container -it -p 8080:80 -p 443:443 ftserverimage

