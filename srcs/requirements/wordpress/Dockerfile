FROM debian:buster

#install php packages
RUN apt-get update -yq && apt-get upgrade -yq

EXPOSE 9000
# Install PHP Extensions that WordPress makes use of
# and curl to latter download wp-cli
RUN apt install -yq php7.3 \
    php-fpm \
    php-mysql \
    curl
#create a directory to store config file
RUN mkdir wp-config

#copy the wordpress config and instalation script to the specific directory
COPY ./conf/wp-config.php /wp-config
COPY ./tools/wp_instalation.sh /wp-config/

#run as an entrypoint which means that the image itself is basically an executable
ENTRYPOINT ["sh", "-c", "/bin/bash /wp-config/wp_instalation.sh;"]
