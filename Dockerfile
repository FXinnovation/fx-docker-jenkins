FROM jenkins:2.19.4-alpine

MAINTAINER FXinnovation

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

ENTRYPOINT ["/bin/tini", "--", "/entrypoint.sh"]
