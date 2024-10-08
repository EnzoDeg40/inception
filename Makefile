all:
	docker compose -f scrs/docker-compose.yml up -d --build

re: clean all

prune:
	docker system prune -a -f

clean:
	-docker stop $$(docker ps -a -q)
	-docker rm $$(docker ps -a -q)
	-docker rmi $$(docker images -q)
	-docker volume rm $$(docker volume ls -q)
# -docker network rm $$(docker network ls -q)
