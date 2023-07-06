FROM debian:buster

#Update and create a setup directory to store the server_setup script
RUN apt-get update -yq && apt-get upgrade -yq && mkdir setup

#Install mariadb
RUN apt-get install -yq mariadb-server

COPY ./tools /var/www/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

RUN service mysql start && mysql < /var/www/server_setup.sql && rm -f /var/www/server_setup.sql;

CMD ["mysqld"]