#!/bin/sh
if [ ! -f "/root/init" ];
then
    touch /root/init
    gitlab-runner register --non-interactive --url $GITLAB_URL --registration-token $REGISTRATION_TOKEN --executor $EXECUTOR --name $RUNNER_NAME  
    gitlab-runner run > /dev/null 2>&1 &
fi
service docker start
sleep 5
chmod 777 /var/run/docker.sock
/bin/bash
