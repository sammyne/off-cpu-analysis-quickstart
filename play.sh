#!/bin/bash

repo_tag=sammyne/off-cpu-analysis-quickstart:alpha

docker run -it --rm \
  --cap-add=ALL \
  -v $PWD/scripts:/workspace/scripts \
  -v $PWD/FlameGraph:/workspace/FlameGraph \
  -v /sys/kernel/debug:/sys/kernel/debug \
  -w /workspace \
  $repo_tag bash
