# Dockerfile

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV JENKINS_USER admin
ENV JENKINS_PASS password

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY configure.groovy /usr/share/jenkins/ref/init.groovy.d/

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
