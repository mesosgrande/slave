FROM centos:centos7
MAINTAINER Mesosgrande / Leon Vliegenthart (lvlie)

WORKDIR /tmp

# install java and mesos rpm
RUN yum install -y java-1.7.0-openjdk-headless http://downloads.mesosphere.io/master/centos/7/mesos-0.20.1-1.0.centos701406.x86_64.rpm && yum clean all

# Add run.sh which creates the needed cgroups stuff
ADD run.sh /run.sh

VOLUME ["/etc/mesos", "/etc/mesos-slave"]

EXPOSE 5051
CMD ["/run.sh"]
