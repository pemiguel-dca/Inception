CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'pemiguel42'@'%' IDENTIFIED BY '123' ;
GRANT ALL PRIVILEGES ON wordpress.* TO 'pemiguel42'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '123' ;
FLUSH PRIVILEGES;
