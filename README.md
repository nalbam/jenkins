# jenkins

## usage
```
sudo docker pull nalbam/jenkins:latest (516MB)
sudo docker pull nalbam/jenkins:alpine (316MB)
sudo docker pull nalbam/jenkins:slim   (341MB)

sudo docker run --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home nalbam/jenkins:latest

kubectl create -f https://raw.githubusercontent.com/nalbam/jenkins/master/jenkins.yml
```

## reference
 * https://github.com/jenkinsci/docker/blob/master/Dockerfile
 * https://github.com/jenkinsci/docker/issues/310
 * https://github.com/samrocketman/jenkins-bootstrap-shared/tree/master/scripts
 * https://blog.kublr.com/using-jenkins-and-kubernetes-for-continuous-integration-and-delivery-4e4341aff013
 * https://akomljen.com/set-up-jenkins-ci-cd-pipeline-with-kubernetes/
