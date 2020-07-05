FROM jenkins/jenkins

MAINTAINER Alejandro alejo.pm92@gmail.com

USER root

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install ansible --upgrade

USER jenkins