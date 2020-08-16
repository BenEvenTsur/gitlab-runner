FROM alpine:latest

ENV EXECUTOR=shell, RUNNER_NAME="Rancher_Runner"

#Install basic packages
RUN apk update && apk upgrade && apk add bash git wget 

#Copy the startup script
COPY --chown=root:root run.sh /etc/run.sh

#Copy README file with basic command for Rancher CLI.
COPY README.md /README.md

#Install Gitlab Runner
RUN wget https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
    chmod 777 gitlab-runner-linux-amd64 && \
    mv gitlab-runner-linux-amd64 /usr/sbin/gitlab-runner

#Install Runcher CLI
RUN wget https://github.com/rancher/cli/releases/download/v2.3.2/rancher-linux-amd64-v2.3.2.tar.gz && \
    tar -zxvf rancher-linux-amd64-v2.3.2.tar.gz && \
    chmod 777 rancher-v2.3.2/rancher && \
    mv rancher-v2.3.2/rancher /usr/sbin/ && \
    rm -rf rancher*

#Install Kubectl
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl && \
    chmod 777 kubectl && \
    mv kubectl /usr/sbin/

CMD /etc/run.sh