# Build and run the project
all: check create_folders
	docker compose -f scrs/docker-compose.yml up -d --build

# Check if Docker is running 
check:
	@docker info > /dev/null 2>&1 || { echo "Docker is not running. Please start Docker and try again."; exit 1; }

# Create folders for volumes
create_folders: check
	@test -d /home/enzo/data/wordpress || sudo mkdir -p /home/enzo/data/wordpress
	@test -d /home/enzo/data/mariadb || sudo mkdir -p /home/enzo/data/mariadb

# Remove folders for volumes	
remove_folders: check
	sudo rm -rf /home/enzo/data/wordpress
	sudo rm -rf /home/enzo/data/mariadb

# Clean and rebuild the project
re: clean all

# Reset all docker installation
reset: check clean
	docker system prune -a -f


remove_volumes: check remove_folders
	docker volume rm $$(docker volume ls -q)

clean: check
	@docker info > /dev/null 2>&1 || { echo "Docker is not running. Please start Docker and try again."; exit 1; }
	-docker stop $$(docker ps -a -q)
	-docker rm $$(docker ps -a -q)
	-docker rmi $$(docker images -q)
	-$(MAKE) remove_volumes
	-docker network rm $$(docker network ls -q)

.PHONY: all re reset clean