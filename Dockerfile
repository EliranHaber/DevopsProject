# Use OpenJDK 8 base image
FROM openjdk:8-jdk-alpine

# Install wget and bash
RUN apk add --no-cache wget bash

# Set working directory
WORKDIR /app

# Copy application files
COPY index.jsp .
COPY WEB-INF/ ./WEB-INF/

# Download and setup Tomcat 8.5.100
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz && \
    tar -xzf apache-tomcat-8.5.100.tar.gz && \
    mv apache-tomcat-8.5.100 tomcat && \
    rm apache-tomcat-8.5.100.tar.gz

# Deploy app to Tomcat
RUN mkdir -p tomcat/webapps/ROOT && \
    cp index.jsp tomcat/webapps/ROOT/ && \
    cp -r WEB-INF tomcat/webapps/ROOT/

# Make Tomcat executable
RUN chmod +x tomcat/bin/*.sh

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["tomcat/bin/catalina.sh", "run"]
