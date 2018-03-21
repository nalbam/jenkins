# Dockerfile

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

ENV JENKINS_OPTS --argumentsRealm.roles.jenkins=admin --argumentsRealm.passwd.jenkins=password

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
