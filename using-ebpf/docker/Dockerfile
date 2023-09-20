FROM rust:1.72.0-bullseye

RUN sed -i 's/deb.debian.org/mirrors.tencent.com/g' /etc/apt/sources.list &&\
  sed -i 's|security.debian.org/debian-security|mirrors.tencent.com/debian-security|g' /etc/apt/sources.list

RUN cd /opt                                               &&\
  git clone https://github.com/brendangregg/FlameGraph    &&\
  cd FlameGraph                                           &&\
  git checkout d9fcc27                                    &&\
  rm -rf .git

ENV PATH=/opt/FlameGraph:$PATH

RUN apt update                                  &&\
  apt install -y bpfcc-tools            &&\
  apt clean                                     &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
