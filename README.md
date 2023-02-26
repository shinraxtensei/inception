# inception-of-things-
<p>This project contains a set of custom Docker images based on Debian that are used to create multiple containers that communicate with each other. The containers include Nginx, WordPress, MariaDB, Redis, Adminer, and FTP.</p>
<h2>Getting Started</h2>
<p>To get started with this project, you'll need to have Docker and Docker Compose installed on your system. Once you have those installed, you can clone this repository to your local machine.</p>
<pre><code>git clone https://github.com/your-username/your-repo.git
</code></pre>
<h2>Running the Containers</h2>
<p>To run the containers, use the following command:</p>
<pre><code>make
</code></pre>
<p>This will create all the necessary containers and start them in detached mode. You can then access the WordPress site by navigating to <code>http://localhost:8080</code> in your web browser.</p>
<h2>Containers</h2>
<p>Here's a brief overview of each container that's included in this project:</p>
<ul>
  <li><strong>nginx:</strong> The Nginx container is used as a reverse proxy to route incoming HTTP requests to the appropriate container.</li>
  <li><strong>wordpress:</strong> The WordPress container contains the WordPress application and is connected to the MariaDB and Redis containers.</li>
  <li><strong>mariadb:</strong> The MariaDB container is used to store the WordPress database.</li>
  <li><strong>redis:</strong> The Redis container is used to cache WordPress data.</li>
  <li><strong>adminer:</strong> The Adminer container provides a web-based interface for managing the MariaDB database.</li>
  <li><strong>ftp:</strong> The FTP container provides a file transfer protocol for uploading and downloading files to the WordPress site.</li>
</ul>
<h2>Networking</h2>
<p>All the containers are connected to a Docker network named <code>wordpress-net</code>. This allows the containers to communicate with each other and share data and resources.</p>
<h2>Volumes</h2>
<p>Two volumes are used to store persistent data for the WordPress site:</p>
<ul>
  <li><strong>wordpress:</strong> This volume stores the WordPress application files.</li>
  <li><strong>mysql:</strong> This volume stores the MariaDB database files.</li>
</ul>
<h2>Custom Docker Images</h2>
<p>All the Docker images used in this project are custom images based on Debian. You can find the Dockerfile for each image in the respective container directory.</p>
</h3>Contributing</h3>
<p>If you find any issues or have suggestions for improving this project, feel free to create an issue or submit a pull request.</p>
