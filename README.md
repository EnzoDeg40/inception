# Inception

## Description

This Docker project sets up a multi-container environment that includes:
- **MariaDB**: A MySQL-compatible database server.
- **Nginx**: A web server to serve your WordPress site and additional static website.
- **WordPress**: A fully configured WordPress instance.
- **Website**: A static website with some assets.

## Prerequisites

- Docker and Docker Compose installed on your machine.

## Environment Variables

Before starting, create a `.env` file at the root of the project and populate it with the following variables:

```bash
MARIA_DATABASE=name_database
MARIA_USER=user
MARIA_PASSWORD=user_password

# WP_ADMIN_NAME can't contain word "admin" 
WP_ADMIN_NAME=root
WP_ADMIN_PASSWORD=root
WP_ADMIN_EMAIL=root@42.fr

WP_USER_NAME=wpuser
WP_USER_PASSWORD=wpuser
WP_USER_EMAIL=wpuser@42.fr
```

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-repo.git
    cd your-repo
    ```

2. Build and start the Docker containers:

    ```bash
    docker-compose up --build
    ```

3. To stop the containers:

    ```bash
    docker-compose down
    ```

## Makefile

The project includes a `Makefile` to streamline common commands:

- `make build`: Build all Docker containers.
- `make up`: Start the containers.
- `make down`: Stop the containers.
- `make clean`: Stop and remove all containers and volumes.
- `make re`: Stop and remove all containers and volumes, then rebuild and start the containers.
- `make purge`: Remove all images, containers, volumes and cache.

## Notes

Additional information and notes about the project can be found in `note.md`.

---

Cela devrait fournir une bonne base pour ton fichier `README.md` ! Si tu veux ajouter des sections spécifiques ou des détails techniques supplémentaires, n'hésite pas à me le dire.