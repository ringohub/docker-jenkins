# Alpine Jenkins Dokcer Container
![stars](https://img.shields.io/docker/stars/ringo/jenkins.svg?colorA=30B8E9&colorB=FFD32E) ![pulls](https://img.shields.io/docker/pulls/ringo/jenkins.svg?colorA=30B8E9) ![automated build](https://img.shields.io/docker/automated/ringo/jenkins.svg?colorA=30B8E9) ![build status](https://img.shields.io/docker/build/ringo/jenkins.svg?colorA=30B8E9)

- Alpine Linux based.
- Jenkins with BlueOcean plugin.
- Installed `dokcer` and `docker-compose` command.

This image is created based on [jenkins:alpine](https://hub.docker.com/_/jenkins/).
Please details and options see [jenkins:alpine](https://hub.docker.com/_/jenkins/).

## Run

```bash
docker pull ringo/jenkins
```

```bash
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/jenkins:/var/jenkins_home \
  -p 8080:8080 -p 50000:50000 \
  --name jenkins -d -u root ringo/jenkins
```

## Build
```bash
docker build -t ringo/jenkins .
```

## Execute docker inside container

Share `/var/run/docker.sock` file between host and container.

![Execute docker inside container](assets/docker-exec.gif)

## Jenkins BlueOcean Plugin
![Jenkins BlueOcean Plugin](assets/blueocean.gif)


### Sample Jenkinsfile
```groovy
#!groovy

pipeline {
  agent {docker 'ringo/sbt'}
  stages {
    stage('lint') {
      steps {
        sh 'echo "Execute scalastyle check"'
      }
    }
    stage('outdated') {
      steps {
        sh 'echo "Check library outdated"'
      }
    }
    stage('test') {
      steps {
        sh 'echo "Run test and covarage"'
      }
    }
    stage('release') {
      steps {
        sh 'echo "Release"'
      }
    }
  }
}
```
