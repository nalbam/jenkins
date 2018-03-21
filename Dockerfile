# Dockerfile

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV JENKINS_OPTS --argumentsRealm.roles.jenkins=admin --argumentsRealm.passwd.jenkins=password

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY user.groovy /usr/share/jenkins/ref/init.groovy.d/

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
