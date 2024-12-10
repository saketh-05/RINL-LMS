# Use an official Tomcat image as a parent image
FROM tomcat:9.0

# Copy the WAR file to the webapps directory in Tomcat
COPY LibraryProject.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 3333
# Start Tomcat server
CMD ["catalina.sh", "run"]

