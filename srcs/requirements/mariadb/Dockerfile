FROM debian:buster
# MARIA DB
RUN apt update -y \
&& apt install -y mariadb-server mariadb-client
COPY conf/my.cnf /etc/
RUN chown -R mysql:mysql /var/lib/mysql

RUN service mysql start && mysql -u root -e "CREATE USER 'tgriffit'@'%' IDENTIFIED BY '42School';\
CREATE DATABASE IF NOT EXISTS dbName ;\
GRANT ALL PRIVILEGES ON dbName.* TO 'tgriffit'@'%';\
ALTER USER 'root'@'localhost' IDENTIFIED BY 'P4ssw0rd';"
#CMD est une commande bloquante. Pour Wordpress, faire un autre Dockerfile.
#Pour faire un autre Dockerfile, creer l'arborescence demandee par le sujet
CMD ["mysqld", "--bind-address=0.0.0.0"]



# WORKDIR data
# COPY . .
# EXPOSE 3000

