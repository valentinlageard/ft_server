FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get -y install wget
RUN apt-get install -y php-mysql php-fpm
RUN apt-get install -y mariadb-server

COPY ./srcs/init.sh ./
COPY ./srcs/nginx-conf ./tmp/nginx-conf
COPY ./srcs/config.inc.php ./tmp/config.inc.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

CMD bash init.sh