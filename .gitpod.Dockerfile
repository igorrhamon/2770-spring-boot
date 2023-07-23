FROM gitpod/workspace-full

USER root

# Install mysql server
RUN apt-get update && apt-get install -y mysql-server

# Allow root access from any host
RUN echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql

# Create a database and a user for your application
RUN echo "CREATE DATABASE vollmed_api; CREATE USER 'root'@'%' IDENTIFIED BY 'myuser '; GRANT ALL ON vollmed_api.* TO 'myuser'@'%'; FLUSH PRIVILEGES;" | mysql

# Expose mysql port
EXPOSE 3306

# Start mysql server
CMD service mysql start && tail -f /dev/null


FROM openjdk:17-jdk-alpine
COPY target/api-0.0.1-SNAPSHOT.jar api-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/api-0.0.1-SNAPSHOT.jar"] 

# connect mysql and springboot to the same network
# docker network create my-network