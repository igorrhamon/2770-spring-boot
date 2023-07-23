FROM openjdk:17-jdk-alpine
COPY target/api-0.0.1-SNAPSHOT.jar api-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/api-0.0.1-SNAPSHOT.jar"]

GRANT ALL ON *.* TO 'user'@'%' IDENTIFIED BY 'password';
