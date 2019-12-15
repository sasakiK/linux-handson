# Linux handson

# How to setup this Handson

1. build docker image

- Dockerfile

```
FROM centos:7

LABEL maintainer "Kensuke Sasaki"

# set password
RUN echo 'root:3f1031' |chpasswd

# create user
RUN useradd Kensuke
RUN echo 'root:3f1031' |chpasswd
RUN echo "newuser ALL=(ALL) ALL" >> /etc/sudoers

# remove cache to reference correct repository
RUN yum -y update && yum clean all

# install sudo
RUN yum install -y sudo

# install vim
RUN yum install -y vim && yum clean all

# set work dir
WORKDIR /home
```

2. run centos7 container

```
docker run --name linux-handson  -it centos7 /bin/sh
```


## Marp startup

1. ファイルを用意

```
1. index.js
2. package.json
3. PITCHME.md
```

2. package.jsonのディレクトリで`node_module`をインストール

```
yarn install
```

3. 試しにslideを展開するサーバー起動

```
yarn dev
```
