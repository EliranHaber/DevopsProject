#!/bin/bash
# Build script for Render deployment
echo "Building HIT DevOps Project..."

# Install Java
apt-get update
apt-get install -y openjdk-8-jdk

# Create target directory
mkdir -p target

# Copy JSP files to target
cp index.jsp target/
cp -r WEB-INF target/

# Create a simple JAR structure (Render expects JAR)
cd target
jar cf hit-devops-project.jar *
cd ..

echo "Build completed successfully!"
