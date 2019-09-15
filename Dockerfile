# Start with a base image containing Java runtime
FROM amazoncorretto:11

# Add Maintainer Info
LABEL maintainer="mauri.claudio@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 19000 available to the world outside this container
EXPOSE 19000

# The application's jar file
ARG JAR_FILE=target/dockerized-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} docker-app.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/docker-app.jar"]

