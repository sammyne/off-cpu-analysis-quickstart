#!/bin/bash

set -e

tag=`TZ=UTC-8 date "+%m%d-%H%M%S"`

cd app
export RUSTFLAGS="-C force-frame-pointers=yes"
cargo build --release
cd -

app/target/release/app &

#offcputime-bpfcc -p `pgrep -nx app` 5

out=scripts/offcpu-by-ebpf-$tag.svg

# -d, --delimited       insert delimiter between kernel/user stacks
# -f, --folded          output folded format
offcputime-bpfcc -df -p `pgrep -nx app` 10 | \
  flamegraph.pl --countname=us --title="Off-CPU Time Flame Graph" --colors=io > $out

echo ""
echo "火焰图已输出至 $out"
