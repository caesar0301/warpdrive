# EVENTS
```
ls /sys/kernel/debug/tracing/events/syscalls 
cat /sys/kernel/debug/tracing/kprobe_events
cat /proc/kallsyms

perf probe cgroup_file_write
perf probe cgroup_file_write__r=cgroup_file_write%return
perf probe cgroup_mkdir
perf probe cgroup_mkdir__r=cgroup_mkdir%return
perf probe cgroup_attach_task
perf probe cgroup_attach_task__r=cgroup_attach_task%return
perf probe sys_execve
perf probe sys_execve__r=sys_execve%return

perf record -e probe:cgroup_attach_task -e probe:cgroup_file_write -e probe:cgroup_mkdir -e probe:cgroup_attach_task__r -e probe:cgroup_file_write__r -e probe:cgroup_mkdir__r -e sched:sched_process_fork -e sched:sched_process_exec -e probe:sys_execve -e  probe:sys_execve__r -F 299 -agBN -- sleep 500 &

execsnoop -t -d 120
```

# Off-CPU Time
```
// CPU time distribution globally
./perftools/bcc/tools/cpudist.py -O

// Off-cpu time overall
./perftools/bcc/tools/offcputime.py -p PID 30 > q17_offcpu_map.txt

// Off-cpu time kernel
./perftools/bcc/tools/offcputime.py -K -p PID 30 > q17_offcpu_map.txt.kernel

// Off-cpu time stack for flame graph
./perftools/bcc/tools/offcputime.py -df -p PID 30 > q17_offcpu_map.stacks

// wakeup time

// perf sched ayalysis
perf sched record -p PID  -- sleep 30
perf sched record -a   -- sleep 15

// perf sched timehist
perf sched timehist -MVw
```
