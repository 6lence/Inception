all: start

start:
	sudo docker-compose up --build ./srcs/requirements/

prune:
	docker system prune -af
