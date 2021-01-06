# docker-jenkins
[![](https://images.microbadger.com/badges/version/fxinnovation/jenkins.svg)](https://microbadger.com/images/fxinnovation/jenkins "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/fxinnovation/jenkins.svg)](https://microbadger.com/images/fxinnovation/jenkins "Get your own image badge on microbadger.com")

## Description
This image contains jenkins. The image is based on the official alpine jenkins image. It should be more lightweight this way.

## Versioning

This repository follows [Semantic Versioning 2.0.0](https://semver.org/).

We do NOT push a `latest` tag for this image. You should always pin a specific version for it.
We do not follow the jenkins release tags in the docker image tags. You can always find the jenkins version in the Dockerfile that was used to create the image or you can use the labels.

## Usage
This image was edited to be able to use `persistent disks` on kubernetes. If you're not planning to use this image in a kubernetes cluster, you should use the official jenkins image on which this is based.

## Git Hooks

This repository uses [pre-commit](https://pre-commit.com/) hooks.

### Usage

```
pre-commit install
pre-commit install -t commit-msg
```
## Commit Messages

This repository follows the [afcmf](https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/pre-commit-afcmf) standard for it's commit messages.

## Labels
We set labels on our images with additional information on the image. we follow the guidelines defined at http://label-schema.org/. Visit their website for more information about those labels.

## Comments & Issues
If you have comments or detect an issue, please be advised we don't check the docker hub comments. You can always contact us through the repository.
