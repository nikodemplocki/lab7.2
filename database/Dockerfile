# Use a specific version of the Debian image as a base
FROM debian:buster-slim

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Update the package list and install MySQL and iputils-ping
RUN apt-get update && \
    apt-get install -y default-mysql-server iputils-ping && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Optional: Copy your custom MySQL configuration if you have one
# COPY my.cnf /etc/mysql/my.cnf

# Initialize the database and create the initial tables
# Note: These are very basic commands just to get the MySQL server running.
# You should customize the following commands to set up your initial database and user.
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" && \
    mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;"

# Expose port 3306 for MySQL connections
EXPOSE 3306

# Use the mysqld_safe script since it handles starting the server and ensuring it stays running
CMD ["mysqld_safe"]
