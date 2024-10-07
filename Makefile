all:
	docker compose -f scrs/docker-compose.yml up -d --build


clean:
	rm -rf /home/enzo/data/wordpress/*
# illegal operation
	docker system prune -a -f