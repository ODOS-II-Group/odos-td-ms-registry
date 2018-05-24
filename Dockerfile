FROM docker.lassiterdynamics.com:5000/centos7-java8:latest
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    SPRING_PROFILES_ACTIVE=prod,native
EXPOSE 8761
RUN mkdir /target && \
    chmod g+rwx /target
CMD java \
        ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom \
        -jar /jhipster-registry.war --spring.profiles.active=${SPRING_PROFILES_ACTIVE}

COPY target/jhipster-registry-3.2.4.war /jhipster-registry.war
COPY central-config /

USER centos
