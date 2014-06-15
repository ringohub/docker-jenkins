FROM ringo/scientific:6.5

MAINTAINER Yoshiki Aoki <ringohub@gmail.com>

ENV LANG en_US.UTF-8

RUN yum -y update
RUN yum -y upgrade

# Install java
RUN yum install -y java-1.7.0-openjdk-devel.x86_64

# Install Jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins

# Install ssh
RUN yum install -y openssh-server openssh-clients

RUN yum -y clean all

# Change root password
RUN echo "root:root" | chpasswd

EXPOSE 22 8080
ENTRYPOINT service sshd start && \
    service jenkins start && \
    /bin/bash
