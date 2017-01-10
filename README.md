# Jenkins
## Description
This container contains jenkins. This will allow you to run jenkins in docker. 
It is based on the official alpine jenkins image but has some small added 
features.

## Why not use the official image ?
A couple of thing have been added. This image works well when used on a k8s 
cluster that uses `Persistent Volumes`.

By default, the official container is runned as jenkins. Altough this is good, 
when using k8s, he mounts the volume with root having as the only owner of the
volume. This means that jenkins doesn't start as it doesn't have access to its 
workspace.

The workaround that was used is to launch the container as root user, change 
permissions on the workspace folder to jenkins and then launch jenkins using the 
jenkins user.

## Usage
Like said before, this container should be used in a k8s context. That's why 
there is no command specified here. Altough this image isn't k8s specific, but 
you'd better use the official image if you don't run in the the permission
problem.

If there is existing data (users, jobs, etc) on the mounted volume, it will use 
these. If not, you just have to check the logs of the container for the 
randomly generated password and start creating your users.
