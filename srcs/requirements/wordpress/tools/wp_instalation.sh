#!/bin/sh

mkdir -p /var/www/html
cd /var/www/html
if [ -f /var/www/html/wp-config.php ]; then
    echo "Config file already exists!"
else
    mv -f /wp-config/wp-config.php /var/www/html/
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/bin/wp
    wp core download --allow-root
    #Replacing the actual values in the wp-config.php file
    sed -i -r "s/database_name_here/$MYSQL_DB_NAME/1" /var/www/html/wp-config.php
    sed -i -r "s/username_here/$MYSQL_USER/1" /var/www/html/wp-config.php
    sed -i -r "s/password_here/$MYSQL_PASSWORD/1" /var/www/html/wp-config.php
    sed -i -r "s/localhost/$MYSQL_DB_HOST/1" /var/www/html/wp-config.php
    wp core install --url=$WP_DOMAIN_NAME/ \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL --skip-email \
                    --allow-root
    wp user create $WP_USER_NAME $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
fi
#php-fpm must listen on port 9000
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
#This directory is used by PHP-FPM to store Unix domain sockets
mkdir -p /run/php
#Run php-fpm7.3 in the foreground to keep the container alive
php-fpm7.3 -F -R
