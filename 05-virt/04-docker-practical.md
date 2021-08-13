Вопрос 1. \
Dockerfile:
````
FROM archlinux:latest

RUN pacman -Syy

RUN pacman -S ponysay --noconfirm

ENTRYPOINT ["ponysay"]
CMD ["Hey, netology"]
````
Ссылка на хаб: https://hub.docker.com/repository/docker/serno/ponyarchli \
Вопрос 2. \
Dockerfile(amazoncorretto):
````
FROM amazoncorretto:latest

RUN curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | tee /etc/yum.repos.d/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum upgrade
RUN yum install jenkins -y

WORKDIR /usr/lib/jenkins

ENTRYPOINT ["java"]
CMD ["-jar", "jenkins.war"]
````
Ссылка на хаб: https://hub.docker.com/layers/162075554/serno/jenkinstest/ver1/images/sha256-592e08a7a9121fff84e871895c0320b4fa60b632856616d73194bf3441f29ace?context=repo \
Dockerfile(ubuntu):
````
FROM ubuntu:latest

WORKDIR /tmp/

RUN apt-get update
RUN apt-get install gnupg2 -y
RUN apt search openjdk
RUN apt install openjdk-11-jdk -y
RUN apt-get install wget -y
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key > jenkins.io.key
RUN apt-key add jenkins.io.key
RUN sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install jenkins -y

WORKDIR /usr/share/jenkins

ENTRYPOINT ["java"]
CMD ["-jar", "jenkins.war"]

````
Ссылка на хаб: https://hub.docker.com/layers/162451528/serno/jenkinstest/ver2/images/sha256-259fbce6380315691c37ec85ed945771b277c57dd8d6af8fa0078b41aef3dcd4?context=repo \
Вопрос 3. \
Dockerfile:
````
FROM node:alpine
WORKDIR /usr
EXPOSE 3000
ADD https://github.com/simplicitesoftware/nodejs-demo/archive/refs/tags/1.0.2.zip /usr
RUN unzip 1.0.2.zip
WORKDIR /usr/nodejs-demo-1.0.2
RUN npm install

ENTRYPOINT ["node"]
CMD ["app.js", "0.0.0.0", "3000"]
````
