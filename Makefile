all : build

build : 
	@sudo hostsed add 127.0.0.1 mescobar.42.fr && echo "\033[1;32m~|ADD mescobar.42.fr to /etc/hosts|~\033[0m"
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@sudo hostsed rm 127.0.0.1 mescobar.42.fr && echo "\033[1;31m~|DELETE mescobar.42.fr from /etc/hosts|~\033[0m"
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps

delete : down
	@docker image rm wordpress -f
	@docker image rm mariadb -f
	@docker image rm nginx -f
	@docker volume rm mariadb
	@docker volume rm wordpress && echo "\033[1;33m~| Nettoyage des images/containers/volumes de Docker : OK |~\033[0m"\
	
prune :
	@sudo rm -rf /home/user/docker/_data/wordpress/*
	@sudo rm -rf /home/user/docker/_data/mariadb/*
	@docker system prune -af && echo "\033[1;33m~| Nettoyage du cache de Docker : OK |~\033[0m"\
