FROM debian:11.7

RUN sed -i 's/deb.debian.org/mirrors.tencent.com/g' /etc/apt/sources.list &&\
  sed -i 's|security.debian.org/debian-security|mirrors.tencent.com/debian-security|g' /etc/apt/sources.list

RUN apt update                                  &&\
  apt install -y linux-perf                     &&\
  apt clean                                     &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# for TK4-5.4
RUN mv /usr/bin/perf_5.10 /usr/bin/perf_5.4
