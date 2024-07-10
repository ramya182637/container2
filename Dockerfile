FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app

COPY --from=build /app/target/container2-0.0.1-SNAPSHOT.jar container2.jar

ENTRYPOINT ["java", "-jar", "container2.jar"]


