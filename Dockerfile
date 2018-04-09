# Dockerfile

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

ENV JENKINS_USER admin
ENV JENKINS_PASS password

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY extra/configure-security.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY extra/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root
RUN chown -R 1000 /var/jenkins_home && \
    chown -R 1000 /home/jenkins
USER jenkins
