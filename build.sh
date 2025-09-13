#!/bin/bash
# Build script for Render deployment
echo "Building HIT DevOps Project..."

# Install Java 8
apt-get update
apt-get install -y openjdk-8-jdk

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

# Create startup script with Java environment
echo '#!/bin/bash' > start.sh
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> start.sh
echo 'export JRE_HOME=$JAVA_HOME/jre' >> start.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> start.sh
echo 'tomcat/bin/catalina.sh run' >> start.sh
chmod +x start.sh

echo "Build completed successfully!"
