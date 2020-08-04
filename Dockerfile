FROM debian:buster

RUN apt update; \
    apt install -y nginx wget mariadb-server php-fpm php-mysql
    
WORKDIR /var/www/wp
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz ./
ADD ./srcs/wordpress.tar ./
ADD ./srcs/init.sh /tmp/
ADD ./srcs/wp /etc/nginx/sites-available/
ADD ./srcs/wordpress.sql ./
ADD ./srcs/autoindex.sh ./

ENTRYPOINT bash /tmp/init.sh

EXPOSE 80 8080 443 3306
