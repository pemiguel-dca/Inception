CREATE DATABASE IF NOT EXISTS Inception;
CREATE USER IF NOT EXISTS 'pemiguel42'@'%' IDENTIFIED BY '123' ;
GRANT ALL PRIVILEGES ON Inception.* TO 'pemiguel42'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '123' ;
FLUSH PRIVILEGES;