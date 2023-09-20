#!/bin/bash

set -e

repo=sammyne/off-cpu-analysis-quickstart-using-perf
repo_tag=$repo:alpha

if [ -z "`docker images | grep $repo`" ]; then
  bash docker/dockerize.sh
fi

docker run -it --rm                         \
  --cap-add=ALL                             \
  -v $PWD/scripts:/workspace/scripts        \
  -v $PWD/app:/workspace/app                \
  -v /sys/kernel/debug:/sys/kernel/debug    \
  -w /workspace                             \
  $repo_tag bash scripts/do-perf.sh
