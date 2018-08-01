# experiments
FROM docker:stable

RUN apt-get update && \
    apt-get install -y curl && \
    curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh && \
    docker login --username=$DOCKER_USER --password=$DOCKER_PASS
    # usermod -a -G docker $USER && \
    # chmod 666 /var/run/docker.sock && \
    
EXPOSE 8080
CMD [ "fn start" ]
