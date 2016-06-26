hosts="namenode.omnilab.sjtu.edu.cn,resourcemanager.omnilab.sjtu.edu.cn,hadoopjob.omnilab.sjtu.edu.cn,slave01.omnilab.sjtu.edu.cn,slave02.omnilab.sjtu.edu.cn,slave03.omnilab.sjtu.edu.cn,slave04.omnilab.sjtu.edu.cn,slave05.omnilab.sjtu.edu.cn,slave06.omnilab.sjtu.edu.cn,slave07.omnilab.sjtu.edu.cn,slave08.omnilab.sjtu.edu.cn"
alias team="pdsh -w $hosts"
alias team-scp="pdcp -R ssh -w $hosts"