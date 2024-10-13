all: create_folders
	docker compose -f scrs/docker-compose.yml up -d --build

create_folders:
	@test -d /home/enzo/data/wordpress || mkdir -p /home/enzo/data/wordpress
	@test -d /home/enzo/data/mariadb || mkdir -p /home/enzo/data/mariadb
	
remove_folders:
	-rm -rf /home/enzo/data/wordpress
	-rm -rf /home/enzo/data/mariadb

re: clean all

reset: clean
	docker system prune -a -f

clean:
	@docker info > /dev/null 2>&1 || { echo "Docker is not running. Please start Docker and try again."; exit 1; }
	-docker stop $$(docker ps -a -q)
	-docker rm $$(docker ps -a -q)
	-docker rmi $$(docker images -q)
	sudo rm -rf /home/enzo/data/wordpress
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q)

.PHONY: all re reset clean