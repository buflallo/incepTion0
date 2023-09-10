FROM debian:bullseye


RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY conf/mysql.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh script.sh

RUN chmod +x script.sh && mv ./script.sh /tmp

CMD ["/tmp/script.sh"]
