#!/bin/bash
# Build script for Render deployment
echo "Building HIT DevOps Project..."

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
