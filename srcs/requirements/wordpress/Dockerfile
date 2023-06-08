FROM debian:buster
EXPOSE 9000

RUN apt update -y \
&& apt install -y mariadb-client php-fpm php-mysql php-gd php-curl curl php-zip php-xml php-mbstring php-fpm sudo
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html
RUN pwd
WORKDIR /var/www/html
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
RUN chown -R www-data:www-data /var/www/html/
#COPY conf/wp-config.php wp-config.php
RUN rm -f /var/www/wordpress/wp-config-sample.php
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
ARG USER
ARG ADMIN_USER
ARG WP_PATH=/var/www/html
ARG URL
RUN adduser --disabled-password "$USER"
COPY "./create-config.sh" .
RUN chmod +x ./create-config.sh
ENTRYPOINT ["./create-config.sh"]
