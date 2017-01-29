FROM jenkins:2.32.1-alpine

MAINTAINER FXinnovation

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

ENTRYPOINT ["/bin/tini", "--", "/entrypoint.sh"]
