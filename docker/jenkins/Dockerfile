FROM jenkins:latest

ADD ./data /opt
WORKDIR /opt

# RUN ls -al /opt
# COPY ./data/bypass.groovy /var/jenkins_home/init.groovy.d/bypass.groovy

USER root

ENV JENKINS_UC_DOWNLOAD "http://mirrors.jenkins-ci.org"
# RUN ls /opt
# RUN /usr/local/bin/install-plugins.sh < /opt/plugins.txt

# RUN curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz \
#     && tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz

USER jenkins


# In case you are running as root
# RUN chown -R jenkins:jenkins /var/lib/jenkins/init.groovy.d/

ENV PATH="${PATH}:/usr/local/go/bin"

# COPY /var/jenkins_home/secrets/initialAdminPassword /opt/shared/initialAdminPassword

# RUN /opt/bypass.sh