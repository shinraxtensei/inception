# inception-of-things-
inception of things
This project contains a set of custom Docker images based on Debian that are used to create multiple containers that communicate with each other. The containers include Nginx, WordPress, MariaDB, Redis, Adminer, and FTP.

Getting Started
To get started with this project, you'll need to have Docker and Docker Compose installed on your system. Once you have those installed, you can clone this repository to your local machine.

bash
Copy code
git clone https://github.com/your-username/your-repo.git
Running the Containers
To run the containers, use the following command:

Copy code
docker-compose up -d
This will create all the necessary containers and start them in detached mode. You can then access the WordPress site by navigating to http://localhost:8080 in your web browser.

Containers
Here's a brief overview of each container that's included in this project:

nginx: The Nginx container is used as a reverse proxy to route incoming HTTP requests to the appropriate container.
wordpress: The WordPress container contains the WordPress application and is connected to the MariaDB and Redis containers.
mariadb: The MariaDB container is used to store the WordPress database.
redis: The Redis container is used to cache WordPress data.
adminer: The Adminer container provides a web-based interface for managing the MariaDB database.
ftp: The FTP container provides a file transfer protocol for uploading and downloading files to the WordPress site.
Networking
All the containers are connected to a Docker network . This allows the containers to communicate with each other and share data and resources.

Volumes
Two volumes are used to store persistent data for the WordPress site:

wordpress: This volume stores the WordPress application files.
mysql: This volume stores the MariaDB database files.
Custom Docker Images
All the Docker images used in this project are custom images based on Debian. You can find the Dockerfile for each image in the respective container directory.

Contributing
If you find any issues or have suggestions for improving this project, feel free to create an issue or submit a pull request.
