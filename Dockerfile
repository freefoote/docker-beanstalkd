FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Daniel Foote <freefoote@dview.net>

RUN apt-get update -q
RUN apt-get -qy install beanstalkd
RUN mkdir /binlog

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD start.sh /start.sh

EXPOSE 11300
VOLUME ["/binlog"]
CMD ["/start.sh"]
