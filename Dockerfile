FROM openjdk:26-ea-trixie
WORKDIR /
EXPOSE 8080
COPY ./springboot2-meetingmng-0.0.1-SNAPSHOT.jar /backend-springboot.jar
CMD ["java","-jar","backend-springboot.jar"]
