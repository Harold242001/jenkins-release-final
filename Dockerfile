FROM jenkins/jenkins:lts

USER root

# Instalar Docker CLI (cliente), zip, unzip y certificados
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl \
        unzip \
        zip && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian bookworm stable" \
        > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean

# Permitir a Jenkins usar docker
RUN groupadd -f docker && \
    usermod -aG docker jenkins

# Docker Desktop socket
ENV DOCKER_HOST=unix:///var/run/docker.sock

USER jenkins