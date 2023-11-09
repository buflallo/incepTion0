#!/bin/bash
sleep 2;
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p  /var/www/html;
	chown -R www-data:www-data /var/www/html;
	mkdir -p /run/php/;

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;

	cd /var/www/html;
	wp core download --allow-root;

	wp core config --allow-root --path='/var/www/html/' --dbname="${DB_NAME}" --dbuser="${DB_USR}" --dbpass="${DB_PASS}" --dbhost="${DB_HOST}" --dbprefix="${DB_PREFIX}";

	wp core install --allow-root --path='/var/www/html/' --url="${SITE_URL}" --title="${TITLE}" --admin_user="${ADM_USR}" --admin_password="${ADM_PASS}" --admin_email="${ADM_MAIL}";

 	wp user create --allow-root --path='/var/www/html/' "${USR_NAME}" "${USR_MAIL}" --role=author --user_pass="${USR_PASS}";

	sleep 2;

fi

`php-fpm7.4 -F`

exec "$@"
