# experiments
FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce && \
    curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh && \
    usermod -a -G docker $USER && \
    chmod 666 /var/run/docker.sock && \
    docker login --username=$DOCKER_USER --password=$DOCKER_PASS
    
EXPOSE 8080
CMD [ "fn start" ]
