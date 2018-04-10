# Dockerfile

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

USER root

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV JENKINS_USER admin
ENV JENKINS_PASS password

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY extra/configure-security.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY extra/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
