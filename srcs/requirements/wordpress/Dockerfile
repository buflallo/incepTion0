FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install -y wget php7.4\
 php-fpm\
 php-mysql\
 mariadb-client
COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /run/php

COPY ./tools/auto_config.sh /tmp/

RUN chmod +x /tmp/auto_config.sh

CMD ["./tmp/auto_config.sh" ]
