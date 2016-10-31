#
# SBT image based on Oracle JRE 8
#

FROM anapsix/alpine-java:8_server-jre
MAINTAINER 1science Devops Team <devops@1science.org>

ENV SBT_VERSION 0.13.13
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Install sbt
RUN curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

RUN sbt clean

WORKDIR /app
