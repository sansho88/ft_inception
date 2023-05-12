FROM debian:buster
# MARIA DB
RUN apt update -y \
&& apt install -y mariadb-server mariadb-client
COPY my.cnf /etc/
RUN chown -R mysql:mysql /var/lib/mysql

RUN service mysql start

#RUN mysql --bind-address="0.0.0.0"
RUN mysql -uroot --execute="CREATE USER 'tgriffit'@'localhost' IDENTIFIED BY 42School ;" \
&& mysql -uroot --execute="CREATE DATABASE IF NOT EXISTS dbName" \
&& mysql -uroot --execute="GRANT ALL ON dbName.* TO 'tgriffit'@'localhost';"\
&& mysql -uroot --execute="ALTER USER 'root'@'localhost' IDENTIFIED BY 'P4ssw0rd';"


WORKDIR data
COPY . .
EXPOSE 3000

CMD ["mysqld_safe"]