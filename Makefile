DOCKER_COMPOSE_FILE=srcs/docker-compose.yml

all: run

#docker-compose build is used to build or rebuild Docker images.
#docker-compose up is used to start the containers based on the images and run the application.
#-d flag makes the containers run in detached mode, preventing to block the terminal and allowing them to run in the background.
run:
	sudo docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build
	sudo bash srcs/requirements/nginx/tools/hosts.sh

list_containers:
	docker ps -a

list_images:
	docker images -a

list_volumes:
	docker volume ls

list_networks:
	docker network ls

#prune -> to remove unused things
clean:
	sudo docker-compose -f $(DOCKER_COMPOSE_FILE) down
	sudo docker system prune -af
	sudo rm -rf /home/pemiguel/data/wordpress/*
	sudo rm -rf /home/pemiguel/data/mariadb/*

