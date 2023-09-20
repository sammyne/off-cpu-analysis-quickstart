#!/bin/bash

set -e

tag=`TZ=UTC-8 date "+%m%d-%H%M%S"`

cd app
cargo build --release
cd -

# --call-graph=dwarf requires addr2line tool
perf record --call-graph=dwarf -e sched:sched_stat_sleep -e sched:sched_switch \
    -e sched:sched_process_exit -a -g -o perf-$tag.data app/target/release/app

out=scripts/offcpu-$tag.svg

perf script -i perf-$tag.data -F comm,pid,tid,cpu,time,period,event,ip,sym,dso,trace | \
    ./FlameGraph/stackcollapse-perf.pl | \
    ./FlameGraph/flamegraph.pl --countname=ms --title="Off-CPU Time Flame Graph" --colors=io > $out

echo ""
echo "火焰图已输出至 $out"
