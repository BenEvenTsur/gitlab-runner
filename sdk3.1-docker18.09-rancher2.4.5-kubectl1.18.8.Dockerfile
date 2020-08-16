FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ENV TZ="Asia/Jerusalem"

# Install docker
RUN apt-get update && \
    apt-get install -y nano docker.io
    
#Copy the startup script
COPY --chown=root:root docker_run.sh /etc/run.sh

#Copy README file with basic command for Rancher CLI.
COPY README.md /README.md

#Install Gitlab Runner
RUN wget https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
    chmod 777 gitlab-runner-linux-amd64 && \
    mv gitlab-runner-linux-amd64 /usr/sbin/gitlab-runner

#Install Runcher CLI
RUN wget https://github.com/rancher/cli/releases/download/v2.4.5/rancher-linux-amd64-v2.4.5.tar.gz && \
    tar -zxvf rancher-linux-amd64-*.tar.gz && \
    chmod 777 rancher-*/rancher && \
    mv rancher-*/rancher /usr/sbin/ && \
    rm -rf rancher*

#Install Kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod 777 kubectl && \
    mv kubectl /usr/sbin/

ENTRYPOINT /etc/run.sh