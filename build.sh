#!/bin/bash
# Build script for Render deployment
echo "Building HIT DevOps Project..."

# Download and setup Tomcat
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
tar -xzf apache-tomcat-9.0.65.tar.gz
mv apache-tomcat-9.0.65 tomcat

# Deploy our app to Tomcat
mkdir -p tomcat/webapps/ROOT
cp index.jsp tomcat/webapps/ROOT/
cp -r WEB-INF tomcat/webapps/ROOT/

echo "Build completed successfully!"
