FROM tomcat:10.1.43-jdk21-temurin-jammy
# 10.1.43-jdk21-temurin-jammy, 10.1-jdk21-temurin-jammy
RUN rm -rf /usr/local/tomcat/webapps/*
COPY LibraryProject.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 3333
CMD ["catalina.sh", "run"]
