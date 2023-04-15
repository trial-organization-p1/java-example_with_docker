FROM maven:amazoncorretto as stage1
WORKDIR /javaapp
COPY . .
RUN mvn clean install

FROM adhig93/tomcat-conf
COPY --from=stage1 /javaapp/target/*.war /usr/local/tomcat/webapps/
