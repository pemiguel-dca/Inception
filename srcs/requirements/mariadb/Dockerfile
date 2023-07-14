FROM debian:buster

RUN apt-get update -yq && apt-get upgrade -yq

#Install mariadb
RUN apt-get install -yq mariadb-server

#Copy the server.cnf config and server_setup.sql to the specific directory
COPY ./tools /var/www/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

#Run mysql and pass 'server_setup.sql' to create the database and so on ...
RUN service mysql start && mysql < /var/www/server_setup.sql && rm -f /var/www/server_setup.sql;

#Start MariaDB/mysql, listening to incoming connections on port 3306
CMD ["mysqld"]
