FROM debian:buster
EXPOSE 9000
# MARIA DB
RUN apt update -y \
&& apt install -y mariadb-client php-fpm php-mysql php-gd php-curl curl php-zip php-xml php-mbstring php-fpm sendmail sudo
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY conf/* /etc/php/7.3/fpm/pool.d
COPY create-config.sh /tmp/
RUN chmod +x /tmp/create-config.sh
ARG USER
ARG WP_PATH
ARG URL
RUN adduser --disabled-password "$USER"
CMD ["sh", "/tmp/create-config.sh"]
