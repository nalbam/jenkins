# Dockerfile

# jenkins-version: 2.107.1-2

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
