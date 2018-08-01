# experiments
# FROM docker:stable
FROM gitlab/dind

RUN apt-get update && \
    apt-get install -y curl && \
    curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh && \
    usermod -a -G docker $USER && \
    chmod 666 /var/run/docker.sock
    # docker login --username=$DOCKER_USER --password=$DOCKER_PASS
    # usermod -a -G docker $USER && \
    # chmod 666 /var/run/docker.sock && \
    
EXPOSE 8080
CMD [ "fn start" ]
