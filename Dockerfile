FROM debian:buster
# MARIA DB
RUN apt update -y \
&& apt install -y mariadb-server mariadb-client
COPY my.cnf /etc/
RUN chown -R mysql:mysql /var/lib/mysql

#CMD ["mysqld_safe"]


#
RUN service mysql start && mysql -u root -e "CREATE USER 'tgriffit'@'%' IDENTIFIED BY '42School';\
CREATE DATABASE IF NOT EXISTS dbName ;\
GRANT ALL PRIVILEGES ON dbName.* TO 'tgriffit'@'%';\
ALTER USER 'root'@'localhost' IDENTIFIED BY 'P4ssw0rd';"
CMD ["mysqld", "--bind-address=0.0.0.0"]

# WORKDIR data
# COPY . .
# EXPOSE 3000

