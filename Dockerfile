FROM debian:buster

MAINTAINER gtaverne

LABEL Creator: "gtav"

#to download
RUN apt-get update -y && apt-get install -y \
		wget \
		nginx \
		openssl \
		mariadb-server \
		mariadb-client \
		gettext-base


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

#To enable auto-index by default, here we create an env variable
#We will re-use that variable in config_nginx and run.sh
ENV auto_index=on

#Onboard in the container all the useful sources
#I chose to name all the sources
COPY srcs/config_nginx .
COPY srcs/run.sh .
COPY srcs/config.inc.php .
COPY srcs/wp-config.php .
#This command will execute everything needed once in the container
CMD bash run.sh && echo "WELCOME ON BOARD\n" && bash


#Useful commands

#to remove an old image
#docker rmi -f my_image

#to build the image
#docker build -t my_image
#to start my container once the image is built
#docker run --rm --name my_container -it -p 8080:80 -p 443:443 ftserverimage
#docker run --rm --name my_container -it -e auto_index=off -p 8080:80 -p 443:443 my_image


