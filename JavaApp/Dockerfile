FROM alpine/git
WORKDIR /myapp
RUN git clone https://github.com/ChristosPitsis/PerfectMatch.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /myapp
COPY --from=0 /myapp/PerfectMatch /myapp
RUN mvn clean package -Dspring-boot.run.profiles=dockerTest,testQivos

FROM openjdk:8-jre-alpine
WORKDIR /myapp
COPY --from=1 /myapp/target/PerfectMatch.jar /myapp
EXPOSE 8080
CMD java -jar -Dspring.profiles.active=dockerTest PerfectMatch.jar
