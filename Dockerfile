# Dockerfile

FROM jenkins/jenkins:lts

MAINTAINER me@nalbam.com

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

VOLUME /var/jenkins_home

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
