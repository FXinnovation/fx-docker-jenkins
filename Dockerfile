FROM jenkins:2.32.2-alpine

ENV JENKINS_VERSION=2.32.2

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

ENTRYPOINT ["/bin/tini", "--", "/entrypoint.sh"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="jenkins" \
      "org.label-schema.base-image.name"="docker.io/library/jenkins" \
      "org.label-schema.base-image.version"="2.32.2-alpine" \
      "org.label-schema.description"="Jenkins in a container" \
      "org.label-schema.url"="https://www.jenkins.io" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-jenkins" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.jenkins.version"=$JENKINS_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Should only be used on k8s. Check README.md for details why."
