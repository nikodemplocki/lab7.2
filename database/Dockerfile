FROM debian:buster-slim

ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

RUN apt-get update && \
    apt-get install -y default-mysql-server iputils-ping && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean


RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" && \
    mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld_safe"]
