FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install -y wget php\
 php-fpm\
 php-mysql\
 mariadb-client
COPY ./conf/www.conf  /etc/php/7.3/fpm/pool.d/www.conf


COPY ./tools/auto_config.sh /tmp/

RUN chmod +x /tmp/auto_config.sh

ENTRYPOINT ["/tmp/auto_config.sh" ]
