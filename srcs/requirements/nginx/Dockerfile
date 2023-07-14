FROM debian:buster

#Update and install nginx and openssl
RUN apt-get update -yq && apt-get install -yq nginx \
    openssl
#Create the directory for ssl_certificates
RUN mkdir -p /etc/nginx/ssl_certificates
#EXPOSE exposes the specified port and makes it available only for inter-container communication
EXPOSE 443
#Create both certificates(self assigned, -x509 indicates that) and redirect them to a specific file, the last line is needed to fill out the form that is given when trying to create a key
#'-out' option specifies the output file path for the generated self-signed certificate in PEM format and the '-outkey' is for the generated private key
RUN openssl req -newkey rsa:4096 -x509 -sha256 -nodes \
    -out /etc/nginx/ssl_certificates/ssc.pem \
    -keyout /etc/nginx/ssl_certificates/pkey.key \
    -subj "/C=PT/ST=Porto/L=Porto/O=42 School/OU=42 Porto/CN=pemiguel/"
#Copy the new configuration to nginx directory
COPY ./conf/nginx.conf /etc/nginx/
#Daemon is a computer program that runs as a background process, rather than being under the direct control of an interactive user, by turning it off, nginx will be run in the foreground
CMD ["nginx", "-g", "daemon off;"]
