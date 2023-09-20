#!/bin/bash

set -e

repo=sammyne/off-cpu-analysis-quickstart-using-ebpf
repo_tag=$repo:alpha

if [ -z "`docker images | grep $repo`" ]; then
  bash docker/dockerize.sh
fi

# '--pid host' 选项很重要，直接决定能否收集到性能数据。
docker run -it --rm                         \
  --privileged                              \
  --pid host \
  --cap-add=ALL                             \
  -v $PWD/scripts:/workspace/scripts        \
  -v $PWD/app:/workspace/app                \
  -v /lib/modules:/lib/modules              \
  -v /sys/kernel/debug:/sys/kernel/debug    \
  -v /usr/src/kernels:/usr/src/kernels      \
  -w /workspace                             \
  $repo_tag bash scripts/do-perf.sh
  