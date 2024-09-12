WORKDIR /usr/local/tomcat

COPY webapps/CasaSegura.war /usr/local/tomcat/webapps/

EXPOSE 8080

