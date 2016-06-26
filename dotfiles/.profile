#!/bin/bash
# Configurations for .profile, .bash_profile, or .bashrc

export LC_CTYPE=zh_CN.UTF-8
export EDITOR='vim'
export DEVROOT=/home/chenxm/workspace/tw

# Java
export JAVA_HOME=/usr/lib/jvm/default
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7*) # For macOS

export JAVA_OPTIONS="-Xmx8191m -XX:MaxPermSize=2048m"
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export MAVEN_OPTS="-Xmx8191m -XX:MaxPermSize=2048m"

# Texlive
export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-linux/:$PATH
export MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info:$INFOPATH

# Alias
alias go_hive_metastore="$DEVROOT/inceptor_idea/bin/start_hive.sh org.apache.hadoop.hive.metastore.HiveMetaStore &"
alias go_hive_server1="$DEVROOT/inceptor_idea/bin/start_hive.sh io.transwarp.ngmr.NgmrServer --hiveconf hive.metastore.uris=thrift://localhost:9083 &"
alias go_beeline1="$DEVROOT/inceptor_idea/bin/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive://localhost:10000/default"
alias go_hive_server2="$DEVROOT/inceptor_idea/bin/start_hive.sh io.transwarp.inceptor.InceptorServer2 &"
alias go_beeline2="$DEVROOT/inceptor_idea/bin/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive2://localhost:10000/default"

alias rstudio='LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/server: open -a RStudio'

# Spark
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
alias sbt-java1.6="sbt -java-home $(/usr/libexec/java_home -v '1.6*')" # For macOS
