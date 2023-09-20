# off cpu 分析快速开始

## 环境
- linux 内核：TK4-5.4

## 快速开始

### 1. 更改内核设置
```bash
echo 1 > /proc/sys/kernel/sched_schedstats
```

### 2. 运行示例
```bash
bash play.sh
```

日志片段的输出样例如下

```bash
/workspace
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.576 MB perf-0920-100711.data (162 samples) ]
'trace' not valid for hardware events. Ignoring.
'trace' not valid for software events. Ignoring.
'trace' not valid for hardware-cache events. Ignoring.
'trace' not valid for unknown events. Ignoring.
'trace' not valid for unknown events. Ignoring.
'trace' not valid for unknown events. Ignoring.

火焰图已输出至 scripts/offcpu-0920-100711.svg
```

## 参考文献
- [DatenLord | Rust程序性能分析](https://rustmagazine.github.io/rust_magazine_2021/chapter_11/rust-profiling.html)
- [Linux perf_events Off-CPU Time Flame Graph](https://www.brendangregg.com/blog/2015-02-26/linux-perf-off-cpu-flame-graph.html)
