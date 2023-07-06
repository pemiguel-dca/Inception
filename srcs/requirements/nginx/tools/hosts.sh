#Store the nginx container ip in 'NGINX_IP' var
NGINX_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx)

#Removes any previous entries in the /etc/hosts file that contain the 42.fr domain.
sed -i '/42.fr/d' /etc/hosts
#Inserts a new entry at the beginning of the /etc/hosts file.
#It adds the NGINX_IP value, followed by the hostname www.pemiguel.42.fr.
sed -i '1i'$NGINX_IP' www.pemiguel.42.fr' /etc/hosts