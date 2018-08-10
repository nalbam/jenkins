# Dockerfile

FROM jenkins/jenkins:lts

USER root

ENV JAVA_OPTS "-Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Seoul"

RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo 'Asia/Seoul' > /etc/timezone

USER jenkins
