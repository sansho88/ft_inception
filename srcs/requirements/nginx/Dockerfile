FROM debian:buster
RUN apt update -y && apt install -y sudo openssl
RUN mkdir -p /etc/ssl/private /etc/ssl/certs
RUN openssl req -newkey rsa:4096 -x509 -noenc -out /etc/ssl/certs/sslcert.crt -days 4200 -keyout COPY /etc/ssl/private/sslkey.key
RUN apt install -y nginx
COPY conf/default /etc/nginx/sites-available/

