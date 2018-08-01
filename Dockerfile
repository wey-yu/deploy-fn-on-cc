# experiments
# FROM docker:stable
FROM gitlab/dind

RUN docker login --username=$DOCKER_USER --password=$DOCKER_PASS
RUN echo "🙂😢🤔"
RUN apt-get update && \
    apt-get install -y curl && \
    curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh && \
    usermod -a -G docker $USER && \
    chmod 666 /var/run/docker.sock && \
    usermod -a -G docker $USER && \
    chmod 666 /var/run/docker.sock && \
    export FN_REGISTRY=$DOCKER_USER
    
EXPOSE 8080
CMD [ "fn start" ]
