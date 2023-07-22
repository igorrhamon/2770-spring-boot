FROM gitpod/workspace-full

USER root

# Install mysql server
RUN apt-get update && apt-get install -y mysql-server

# Allow root access from any host
RUN echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql

# Expose mysql port
EXPOSE 3306

# Start mysql server
CMD service mysql start && tail -f /dev/null
