FROM jenkins/jenkins:latest

ADD ./data /opt
WORKDIR /opt

RUN /usr/local/bin/install-plugins.sh < /opt/plugins.txt

USER root
RUN curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz
USER jenkins

ENV PATH="${PATH}:/usr/local/go/bin"
