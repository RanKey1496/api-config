FROM maven as build
COPY . /app
RUN mkdir -p /app/target
WORKDIR /app
RUN mvn clean install

FROM frolvlad/alpine-oraclejdk8:slim
COPY --from=build /app/target /
ENTRYPOINT ["java","-jar","/NoMiente-0.0.1-SNAPSHOT.jar"]
