FROM jenkins:latest

ADD ./data /opt
WORKDIR /opt

USER root

ENV JENKINS_UC_DOWNLOAD "http://mirrors.jenkins-ci.org"
RUN ls /opt
RUN /usr/local/bin/install-plugins.sh < /opt/plugins.txt

RUN apt-get update \
    && curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz

RUN /opt/bypass.sh

USER jenkins

ENV PATH="${PATH}:/usr/local/go/bin"
