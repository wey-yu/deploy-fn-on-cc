# experiments
FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-get update && \
    apt-get -y install docker-ce && \
    curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh && \
    docker login --username=$DOCKER_USER --password=$DOCKER_PASS
    
    #usermod -a -G docker $USER && \
    #chmod 666 /var/run/docker.sock && \
    
EXPOSE 8080
CMD [ "fn start" ]
