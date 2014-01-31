# base - Base Image with supervisord

FROM ubuntu:precise
#phusion/baseimage:0.9.1
MAINTAINER Luis Bianchin <luis@l433.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    apt-get -qq update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install supervisor && \
	rm /usr/sbin/policy-rc.d

ADD locale /etc/default/locale
ADD supervisord.conf /etc/supervisor/supervisord.conf

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

CMD ["/usr/bin/supervisord"]
