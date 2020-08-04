mkdir /etc/nginx/ssl
openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/wp.pem -keyout /etc/nginx/ssl/wp.key -subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=clauren/CN=wp"

mkdir ./phpmyadmin
tar -xvf phpMyAdmin*tar* --strip-components 1 -C ./phpmyadmin
rm -rf ./phpMyAdmin*tar*

ln -s /etc/nginx/sites-available/wp /etc/nginx/sites-enabled/wp
rm -rf /etc/nginx/sites-enabled/default

service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'wp'@'localhost' IDENTIFIED BY 'wp';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql -u root "wordpress" < wordpress.sql

chmod +x autoindex.sh

service nginx start
service php7.3-fpm start

bash
