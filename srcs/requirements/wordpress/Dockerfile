FROM debian:buster

RUN apt-get update -yq && apt-get upgrade -yq

EXPOSE 9000
#Install php packages
RUN apt install -yq php7.3 \
    php-fpm \
    php-mysql \
    curl
#Create a directory to store config file
RUN mkdir -p wp-config

#Copy the wordpress config and instalation script to the specific directory
COPY ./conf/wp-config.php /wp-config
COPY ./tools/wp_instalation.sh /wp-config/

#Run as an entrypoint which means that the image itself is basically an executable
ENTRYPOINT ["sh", "-c", "/bin/bash /wp-config/wp_instalation.sh;"]
