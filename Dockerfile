FROM maven AS builder
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
