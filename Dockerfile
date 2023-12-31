version: '3.1'

services:
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    container_name: wordpres_wptest
    restart: always
    volumes:
      - ./www/:/var/www/html/
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: p4ssw0rd!
      WORDPRESS_DB_NAME: db_wordpress
      WORDPRESS_TABLE_PREFIX: dx36fd_
    ports:
      - 8585:80
    networks:
      - wptest_network
  db:
    image: mysql:latest
    container_name: wptest_mariadb
    restart: always
    volumes:
       - db_data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: p4ssw0rd!
    networks:
      - wptest_network
  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin/phpmyadmin:latest
    container_name: wptest_phpmyadmin
    restart: always
    ports:
      - 8686:80
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: p4ssw0rd!
    networks:
      - wptest_network
networks:
  wptest_network:
volumes:
  db_data:
