all: folder
	docker compose -f scrs/docker-compose.yml up -d --build

folder:
	@test -d /home/enzo/data/wordpress || mkdir -p /home/enzo/data/wordpress
	@test -d /home/enzo/data/mariadb || mkdir -p /home/enzo/data/mariadb
	
re: clean all

reset: clean
	docker system prune -a -f

clean:
	-docker stop $$(docker ps -a -q)
	-docker rm $$(docker ps -a -q)
	-docker rmi $$(docker images -q)
	-docker volume rm $$(docker volume ls -q)
# -docker network rm $$(docker network ls -q)

.PHONY: all re reset clean