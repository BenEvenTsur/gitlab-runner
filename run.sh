#!/bin/sh
if [ ! -f "/root/init" ];
then
    touch /root/init
    gitlab-runner register --non-interactive --url $GITLAB_URL --registration-token $REGISTRATION_TOKEN --executor $EXECUTOR --name $RUNNER_NAME  
    gitlab-runner run > /dev/null 2>&1 &
fi
/bin/bash
