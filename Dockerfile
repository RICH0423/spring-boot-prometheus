FROM openjdk:8-jdk-alpine

MAINTAINER Rich.Lee <rich.lee@deltaww.com>

ARG API_VER

# Install base packages
RUN apk update
RUN apk upgrade

# Change TimeZone to Taipei
RUN apk add --update tzdata
ENV TZ=Asia/Taipei

# Clean APK cache
RUN rm -rf /var/cache/apk/*

VOLUME ["/tmp"]

# Install Bash
RUN apk add --no-cache bash

ADD target/spring-boot-prometheus-1.0.jar app.jar

EXPOSE 8080 8080

ENV JAVA_OPTS="-Xmx2g -Xms2g"

ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar