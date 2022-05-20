FROM --platform=linux/amd64 amazoncorretto:11-alpine3.14

RUN mkdir /myapp
COPY /target/*.jar myapp

# Install Bash
RUN apk update && apk add bash

# Add a group and user 
RUN addgroup -g 1000 user \
    && adduser -u 1000 -G user -s user -D user

# Set the user 
USER user

# Environment Variables 
ENV APP_PORT ""
ENV APP_SERVICE_HOST "localhost"
ENV PORTAL_LANDING "http://localhost:4200"
ENV PORTAL_DASHBOARD "http://localhost:3007"
ENV PORTAL_ADMIN "http://localhost:3000"

EXPOSE ${APP_PORT}

WORKDIR /myapp
CMD java -jar aline-gateway-0.0.1-SNAPSHOT.jar