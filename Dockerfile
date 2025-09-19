FROM tomcat:8.5.100-jdk8-temurin-jammy

# Deploy to ROOT context
COPY index.jsp /usr/local/tomcat/webapps/ROOT/
COPY WEB-INF /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080
CMD ["catalina.sh", "run"]