# Config
chown www-data /var/www/*
chmod -R 755 ~/var/www/*

# Server boot
service nginx start

# Mysql boot
service mysql start

# PHP boot
service php7.3-fpm start

# Install Wordpress


