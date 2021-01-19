service mysql start

# Install Wordpress, recuperation des sources puis installation dans le bon dossier
mkdir -p /var/www/rush42
wget http://wordpress.org/latest.tar.gz
tar -zvxf latest.tar.gz
mv wordpress/ /var/www/rush42/.
mv wp-config.php /var/www/rush42/wordpress/.

#construction de la DB dans wordpress
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "UPDATE mysql.user set plugin='mysql_native_password' WHERE user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#install PHPMyAdmin
cd /var/www/rush42
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -zvxf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english phpmyadmin
mv ../../../config.inc.php phpmyadmin/. && cd && cd ..

#config ssl
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=FR"

#Autoindexation
envsubst '${auto-index}' < config_nginx > default && rm config_nginx
mv default etc/nginx/sites-available/default

#Server boot
service nginx start
# Mysql boot
service mysql restart
# PHP boot
service php7.3-fpm start
