# Create website folder and an index for it
mkdir /var/www/mywebsite && touch /var/www/mywebsite/index.php ;
echo "<?php phpinfo(); ?>" >> /var/www/mywebsite/index.php ;

# Config and start NGINX
mv ./tmp/nginx-conf /etc/nginx/sites-available/mywebsite ;
ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/mywebsite ;
rm -rf /etc/nginx/sites-enabled/default ;
service nginx start ;

# Start and config MYSQL
service mysql start ;
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password ;
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password ;
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password ;
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password ;

# Install, config and start PHPMYADMIN
mkdir /var/www/mywebsite/phpmyadmin ;
cd /tmp ;
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz ;
tar -xvf phpMyAdmin-4.9.5-all-languages.tar.gz --strip-components=1 -C /var/www/mywebsite/phpmyadmin ;
rm /var/www/mywebsite/phpmyadmin/config.sample.inc.php ;
mv /tmp/config.inc.php /var/www/mywebsite/phpmyadmin ;
service php7.3-fpm start ;
cd / ;

# Install and config WORDPRESS
mkdir /var/www/mywebsite/wordpress ;
cd /tmp ;
wget -c https://wordpress.org/latest.tar.gz ;
tar -xvf latest.tar.gz --strip-components=1 -C /var/www/mywebsite/wordpress ;
mv /tmp/wp-config.php /var/www/mywebsite/wordpress ;
rm /var/www/mywebsite/wordpress/wp-config-sample.php ;
chown -R www-data /var/www/* ;
chmod -R 755 /var/www/* ;
cd / ;

bash ;