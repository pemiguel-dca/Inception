DOCKER_COMPOSE=srcs/docker-compose.yml

all: run

#docker-compose build is used to build or rebuild Docker images.
#docker-compose up is used to start the containers based on the images and run the application.
#-d flag makes the containers run in detached mode, preventing to block the terminal and allowing them to run in the background.
run:
	sudo docker-compose -f $(DOCKER_COMPOSE) up -d --build
	sudo bash srcs/requirements/nginx/tools/hosts.sh

list_containers:
	docker ps -a

list_images:
	docker images -a

list_volumes:
	docker volume ls

list_networks:
	docker network ls

#prune -> to remove unused networks
clean:
	sudo docker-compose -f $(DOCKER_COMPOSE) down --rmi all
	sudo docker network prune -f
	sudo docker volume ls -q | xargs -I {} sudo docker volume rm {}
	sudo rm -rf /home/pemiguel/data/wordpress/*
	sudo rm -rf /home/pemiguel/data/mariadb/*

