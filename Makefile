all: build start

build:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	sudo docker-compose -f ./srcs/docker-compose.yml build
	@echo "Inception ready !"

start:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "Inception running on https://mescobar.42.fr"

stop:	
	sudo docker-compose -f ./srcs/docker-compose.yml stop

clean: stop
	sudo docker-compose -f ./srcs/docker-compose.yml down -v

fclean:	clean
	@if [ -n "$$(sudo docker ps -a -q)" ]; then sudo docker rm -f $$(sudo docker ps -a -q); fi
	@if [ -n "$$(sudo docker images -q)" ]; then sudo docker rmi -f $$(sudo docker images -q); fi
	@if [ -n "$$(sudo docker volume ls -q)" ]; then sudo docker volume prune -f; fi
	sudo rm -rf ~/data/*

prune:
	@docker system prune -a

re: fclean all
