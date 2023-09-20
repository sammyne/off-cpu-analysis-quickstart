FROM rust:1.72.0-bullseye

RUN sed -i 's/deb.debian.org/mirrors.tencent.com/g' /etc/apt/sources.list &&\
  sed -i 's|security.debian.org/debian-security|mirrors.tencent.com/debian-security|g' /etc/apt/sources.list

RUN cd /opt                                               &&\
  git clone https://github.com/brendangregg/FlameGraph    &&\
  cd FlameGraph                                           &&\
  git checkout d9fcc27                                    &&\
  rm -rf .git

ENV PATH=/opt/FlameGraph:$PATH

# addr2line is included in binutils
RUN apt update                                  &&\
  apt install -y linux-perf binutils            &&\
  apt clean                                     &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# for TK4-5.4
RUN mv /usr/bin/perf_5.10 /usr/bin/perf_5.4
