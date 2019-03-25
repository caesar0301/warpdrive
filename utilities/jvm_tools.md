## jps
Print process info in jvm, similar to ps as of linux
jps [ options ] [ hostid ]

## jstack
Print stack info of java process or core file or remote debugging service, -J-d64 for x86_64
jstack [ option ] pid
jstack [ option ] executable core
jstack [ option ] [server-id@]remote-hostname-or-IP

## jinfo
Print jvm options of java processes
jinfo [ option ] pid

## jstat
Print statistics of jvm heap and gc
jstat -<option> [-t] [-h<lines>] <vmid> [<interval> [<count>]]

Options:
-class
-compiler
-gc
-gccapacity
-gccause
-gcmetacapacity
-gcnew
-gcnewcapacity
-gcold
-gcoldcapacity
-gcutil
-printcompilation

VMID: pid or [server-id@]remote-hostname-or-IP

## jmap
Print distribution of java objects
jmap [ option ] pid
jmap [ option ] executable core
jmap [ option ] [server-id@]remote-hostname-or-IP
e.g.:
jmap -histo pid
jmap -dump:format=b,file=heap.out pid

## jhat
Analyze offline heap file output by jmap
e.g.:
jhat -J-Xmx512m heap.out

## jmc
-Djava.rmi.server.hostname=192.168.1.107
-Dcom.sun.management.jmxremote.port=18888
-Dcom.sun.management.jmxremote=true
-Dcom.sun.management.jmxremote.ssl=false
-Dcom.sun.managementote.ssl=false
-Dcom.sun.management.jmxremote.authenticate=false
-XX:+UnlockCommercialFeatures
-XX:+FlightRecorder 

## Other Profilers
jconsole, jvisualvm

