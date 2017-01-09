# Jenkins
## Description
This is a docker container containing Jenkins, it is based on the official Jenkins alpine image.

## Why not use the official image ?
A couple of thing have been added. This image works well when used on a k8s cluster that uses Persistent Volumes.

By default, the official container is runned as jenkins. Altough this is good, when using k8s, he mounts the volume as root having the only access. This means that jenkins doesn't start as it doesn't have access to its workspace.

The workaround that was used is to launch the container as root user, change permissions on the workspace folder to jenkins and then launch jenkins using the jenkins user.
## Usage
Like said before, this container should be used in a k8s context. That's why there is no command specified here.
If there was existing data (users, jobs, etc) on the mounted volume, this container will then use these. If not, you just have to check the logs for the randomly generated password in k8s and start creating your users.
