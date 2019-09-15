USER root
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

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

