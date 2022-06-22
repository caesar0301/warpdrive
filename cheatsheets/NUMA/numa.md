## 基本操作
* 查看CPU Core状态：mpstat -P ALL
* 查看进程CPU分量：pidstat
* CPU超线程
```
cat /proc/cpuinfo | grep "physical id" | sort | uniq
cat /proc/cpuinfo | fgrep "cores" | uniq
cat /proc/cpuinfo | grep "processor" | wc -l
```

* 查看CPU和内存的距离：numactl --hardware
* 查看NUMA状态：numastat
* 查看NUMA是否开启：dmesg | grep -i numa
* 查看进程CPU：top, f, P

* 查看NUMA balancing是否开启：/proc/sys/kernel/numa_balancing
* 捕捉NUMA Balancing事件
```
sched:sched_move_numa
sched:sched_stick_numa
sched:sched_swap_numa
```

## 进程状态
* 查看进程NUMA状态: taskset -pc <pid>
* 进程cgroup配置
```
cat /proc/$worker_pid/cgroup
cat /sys/fs/cgroup/cpu/$above_path/cpuset.cpus
```

## NUMA内存分配策略
```
--interleave=nodes        //允许进程在多个node之间交替访问
--membind=nodes           //将内存固定在某个node上，CPU则选择对应的core。
--cpunodebind=nodes       //与membind相反，将CPU固定在某（几）个core上，内存则限制在对应的NUMA node之上
--physcpubind=cpus        //与cpunodebind类似，不同的是物理core
--localalloc              //本地配置
--preferred=node          //按照推荐配置
```

* 查看NUMA内存页分配信息：cat /sys/fs/cgroup/memory/memory.numa_stat

## vm.swappiness
vm.swappiness是操作系统控制物理内存交换出去的策略，该值默认为60。vm.swappiness设置为0表示尽量少swap，100表示尽量将inactive的内存页交换出去。

* 查看vm状态
```
vmstat -an 1，或者cat /proc/meminfo | grep -i inact
cat /proc/sys/vm/swappiness
```
* 临时调整: sysctl vm.swappiness=10
* 永久调整/etc/sysctl.conf添加vm.swappiness = 10并生效sudo sysctl -p
