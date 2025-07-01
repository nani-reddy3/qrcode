# ============for jar file============
# Use a lightweight Java runtime
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file into the image
COPY target/QRgenerator-0.0.1-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

# ============for war file============
# # Use an official Tomcat image with Java 17
# FROM tomcat:9.0-jdk17-temurin

# # Clean default webapp
# RUN rm -rf /usr/local/tomcat/webapps/ROOT

# # Copy WAR as ROOT.war (auto-deploys on Tomcat startup)
# COPY target/QRgenerator-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# # Expose port
# EXPOSE 8080

# # Start Tomcat
# CMD ["catalina.sh", "run"]

