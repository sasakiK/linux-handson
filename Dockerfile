FROM centos:7

LABEL maintainer "Kensuke Sasaki"

# set password
RUN echo 'root:3f1031' |chpasswd

# create user
RUN useradd worker
RUN echo 'worker:3f1031' |chpasswd
RUN echo "worker ALL=(ALL) ALL" >> /etc/sudoers

# remove cache to reference correct repository
RUN yum -y update && yum clean all

# install sudo
RUN yum install -y sudo

# install vim
RUN yum install -y vim && yum clean all

RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# set work dir
WORKDIR /home