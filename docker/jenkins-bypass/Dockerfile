FROM debian

RUN pwd
# ADD ./data /opt
WORKDIR /opt

RUN ls -al

RUN apt-get update && apt-get install -y curl && /opt/bypass.sh
