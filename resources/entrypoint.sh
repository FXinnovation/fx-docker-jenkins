#!/bin/bash
set -e -x
###
# Making sure data volume has correct permissions
###
chown jenkins:jenkins /var/jenkins_home
###
# Launching jenkins as jenkins user
###
su-exec jenkins /usr/local/bin/jenkins.sh
