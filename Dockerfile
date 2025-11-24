# Start from the official Tomcat image (Java 11, Tomcat 9)
FROM tomcat:9.0-jdk11

# (Optional) Add MySQL JDBC driver for database connection
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar /usr/local/tomcat/lib/

# Remove default Tomcat apps for a clean slate
RUN rm -rf /usr/local/tomcat/webapps/*

# Add your project files to the ROOT webapp context
# If you have built a WAR, use:
# COPY target/netflix-clone.war /usr/local/tomcat/webapps/ROOT.war

# If your repo contains raw .jsp/.html/.css/.java in a webapp/ folder:
COPY ./webapp/ /usr/local/tomcat/webapps/ROOT/

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
