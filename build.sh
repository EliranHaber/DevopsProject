#!/bin/bash
# Build script for Render deployment
echo "Building HIT DevOps Project..."

# Download and setup Tomcat 8.5.100 (matching local setup)
wget -q https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz
tar -xzf apache-tomcat-8.5.100.tar.gz
mv apache-tomcat-8.5.100 tomcat

# Deploy our app to Tomcat
mkdir -p tomcat/webapps/ROOT
cp index.jsp tomcat/webapps/ROOT/
cp -r WEB-INF tomcat/webapps/ROOT/

# Make Tomcat executable
chmod +x tomcat/bin/*.sh

echo "Build completed successfully!"
