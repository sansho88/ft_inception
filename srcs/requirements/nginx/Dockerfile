FROM debian:buster
RUN apt update -y && apt install -y sudo openssl
RUN mkdir -p /etc/ssl/private /etc/ssl/certs
#COPY /etc/ssl/private/sslkey.key
RUN openssl req -newkey rsa:4096 -x509 -nodes \
	-out /etc/ssl/certs/sslcert.crt -days 4200 \
	-keyout /etc/ssl/private/sslkey.key -out /etc/ssl/certs/sslcert.crt \
	-subj="/C=FR/ST=AURA/L=Lyon/O=42LyonAuvergneRhoneAlpes/OU=Student/CN=localhost"
RUN apt install -y nginx
#COPY conf/default /etc/nginx/sites-available/
COPY conf/default /etc/nginx/conf.d/nginx.conf
RUN ln -s /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-enabled/
#RUN ln -s /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-available/
#RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/tgriffit.42.fr.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

