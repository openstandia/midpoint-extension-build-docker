FROM maven:3.6.3-jdk-11 as builder

COPY pom.xml /tmp/pom.xml
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve

COPY pom-jar.xml /tmp/pom-jar.xml
RUN mvn -B -f /tmp/pom-jar.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve package clean

COPY pom-ext.xml /tmp/pom-ext.xml
RUN mvn -B -f /tmp/pom-ext.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve package clean

