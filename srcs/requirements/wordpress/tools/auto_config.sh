#!/bin/bash
sleep 2;

	chown -R www-data:www-data /var/www/html;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/;

	cd /var/www/html;
	/usr/local/bin/wp-cli.phar core download --allow-root;

	/usr/local/bin/wp-cli.phar core config --allow-root --path='/var/www/html/' --dbname="${DB_NAME}" --dbuser="${DB_USR}" --dbpass="${DB_PASS}" --dbhost="${DB_HOST}" --dbprefix="${DB_PREFIX}";

	/usr/local/bin/wp-cli.phar core install --allow-root --path='/var/www/html/' --url="${SITE_URL}" --title="${TITLE}" --admin_user="${ADM_USR}" --admin_password="${ADM_PASS}" --admin_email="${ADM_MAIL}";

 	/usr/local/bin/wp-cli.phar user create --allow-root --path='/var/www/html/' "${USR_NAME}" "${USR_MAIL}" --role=author --user_pass="${USR_PASS}";

sleep 2;

fi

`php-fpm7.4 -F`

exec "$@"
