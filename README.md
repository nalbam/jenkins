# jenkins

```
sudo docker pull nalbam/jenkins:latest

sudo docker run --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home nalbam/jenkins:latest
```
 * https://github.com/jenkinsci/docker/blob/master/Dockerfile
 * https://blog.kublr.com/using-jenkins-and-kubernetes-for-continuous-integration-and-delivery-4e4341aff013
