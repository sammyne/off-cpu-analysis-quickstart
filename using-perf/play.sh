#!/bin/bash

set -e

repo=sammyne/off-cpu-analysis-quickstart
repo_tag=$repo:alpha

if [ ! -d FlameGraph ]; then
  git clone https://github.com/brendangregg/FlameGraph.git
  cd FlameGraph
  git checkout d9fcc272b6a08c3e3e5b7919040f0ab5f8952d65
  cd -
fi

if [ -z "`docker images | grep $repo`" ]; then
  bash docker/dockerize.sh
fi

docker run -it --rm                         \
  --cap-add=ALL                             \
  -v $PWD/scripts:/workspace/scripts        \
  -v $PWD/FlameGraph:/workspace/FlameGraph  \
  -v $PWD/app:/workspace/app                \
  -v /sys/kernel/debug:/sys/kernel/debug    \
  -w /workspace                             \
  $repo_tag bash scripts/do-perf.sh
