FROM debian:buster
# MARIA DB
RUN apt update -y \
&& apt install -y mariadb-client php-fpm php-mysql php-gd php-curl curl php-zip php-xml php-mbstring
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY conf/* .
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY create-config.sh /tmp/
#CMD ["/bin/sh", "/tmp/create-config.sh"]
RUN chmod +x /tmp/create-config.sh
CMD ["sh", "/tmp/create-config.sh"]


#CMD ["mysqld", "--bind-address=0.0.0.0"]


# WORKDIR data
# COPY . .
# EXPOSE 3000

