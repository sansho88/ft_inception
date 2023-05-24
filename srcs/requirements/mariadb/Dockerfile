FROM debian:buster
ARG USER
ARG PASS_USER
ARG PASS_ROOT
ARG DB_NAME

# MARIA DB
EXPOSE 3306
RUN apt update -y \
&& apt install -y mariadb-server mariadb-client
COPY conf/my.cnf /etc/
RUN chown -R mysql:mysql /var/lib/mysql
RUN service mysql start && mysql -u root -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASS_USER';\
CREATE DATABASE IF NOT EXISTS $DB_NAME ;\
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER'@'%';\
ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASS_ROOT';"
RUN service mysql stop
CMD ["mysqld", "--bind-address=0.0.0.0"]



# WORKDIR data
# COPY . .
# EXPOSE 3000

