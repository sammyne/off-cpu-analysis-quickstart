#!/bin/bash

cd `dirname ${BASH_SOURCE[0]}`

docker build -t sammyne/off-cpu-analysis-quickstart-using-ebpf:alpha .
