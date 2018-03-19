# jenkins

```
sudo docker images
sudo docker pull nalbam/jenkins:latest
sudo docker run --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home nalbam/jenkins:latest
```
