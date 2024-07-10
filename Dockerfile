FROM openjdk:latest
WORKDIR /app
COPY target/container2-0.0.1-SNAPSHOT.jar .
EXPOSE 8081
CMD ["java", "-jar", "container2-0.0.1-SNAPSHOT.jar"]

