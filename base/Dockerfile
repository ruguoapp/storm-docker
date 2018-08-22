FROM ubuntu:trusty
MAINTAINER jikeapp
RUN apt-get update; apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa; apt-get update; apt-get install -y unzip openjdk-8-jdk wget supervisor docker.io openssh-server
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN echo 'root:jikeapp' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22