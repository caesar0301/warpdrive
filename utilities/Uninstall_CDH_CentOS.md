Uninstall CDH (e.g. CentOS)
===========================

# Preuninstall

## Record user data in

``` bash
/var/lib/flume-ng /var/lib/hadoop* /var/lib/hue /var/lib/navigator /var/lib/oozie /var/lib/solr /var/lib/sqoop* /var/lib/zookeeper data_drive_path/dfs data_drive_path/mapred data_drive_path/yarn
```

## Stop cluster from UI


# Uninstall Cloudera Manager

## Installed with cloudera-manager-installer.sh

``` bash
sudo /usr/share/cmf/uninstall-cloudera-manager.sh
```

## Otherwise

``` bash
sudo service cloudera-scm-server stop
sudo service cloudera-scm-server-db stop

sudo yum remove -y cloudera-manager-server
sudo yum remove -y cloudera-manager-server-db-2
```

# Uninstall Cloudera Manager Agent and Managed Software

## Stop services

``` bash
sudo service cloudera-scm-agent next_stop_hard
sudo service cloudera-scm-agent stop/hard_stop
```

## Do uninstalling

``` bash
sudo yum remove -y 'cloudera-manager-*'
sudo yum clean all 
```
# Uninstall related CDH packages

``` bash
rpm -e `rpm -qa | grep cdh`
```

# Remove Cloudera Manager and User Data

## Kill Cloudera Manager and Managed Processes

**(on ALL agents, optional to complement failed UI termination)**

``` bash
for u in cloudera-scm flume hadoop hdfs hbase hive httpfs hue impala llama mapred oozie solr spark sqoop sqoop2 yarn zookeeper; do sudo kill $(ps -u $u -o pid=); done

sudo rm /tmp/.scm_prepare_node.lock

sudo umount cm_processes
sudo rm -Rf /usr/share/cmf /var/lib/cloudera* /var/cache/yum/cloudera* /var/log/cloudera* /var/run/cloudera*

sudo rm -Rf /var/lib/flume-ng /var/lib/hadoop* /var/lib/hue /var/lib/navigator /var/lib/oozie /var/lib/solr /var/lib/sqoop* /var/lib/zookeeper

sudo rm -Rf data_drive_path/dfs data_drive_path/mapred data_drive_path/yarn
```

## Stop and Remove External Databases

