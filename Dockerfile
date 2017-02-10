FROM jenkins:2.32.2-alpine

MAINTAINER FXinnovation <cloudsquad@fxinnovation.com>

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

ENTRYPOINT ["/bin/tini", "--", "/entrypoint.sh"]
