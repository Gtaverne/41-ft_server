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
	php-mysql \
	php7.3-fpm \
	php-mysql \
	php-curl \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-zip

RUN mkdir /var/www/rush42 && touch /var/www/rush42/index.php

# Wordpress
RUN cd ./tmp/ && wget http://wordpress.org/latest.tar.gz && \
tar xfvz latest.tar.gz && mv wordpress ../var/www/rush42/wordpress && cd 

# PHP My admin
RUN cd ./var/www/rush42/ && wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz


#conf
COPY srcs/default ~/etc/nginx/sites-available/rush42
COPY srcs/run.sh .
CMD bash run.sh && bash


# Mariadb




