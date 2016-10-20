#!/bin/bash
# Run multiple tests of precommit regression
# By XC

set -e

THIS_FILE=$(cd ${0%/*} && echo $PWD/${0##*/})
THIS_HOME=`dirname $THIS_FILE`

echo $THIS_HOME

# TPC-DS
echo "Starting TPC-DS ..."
cd /home/benchmark/tpcds-2g-test
./tpcds-test-2g.pl -c > $THIS_HOME/tpcds.log &

# TPC-H, Ignore 17的错误，是因为精度问题
echo "Starting TPC-H ..."
cd /home/zqchen/tpch_2_17_0/
./runAll.sh tpch_orc_1 > $THIS_HOME/tpch.log &

# UT Data Type, Ignore 后面有几个timestamp相关的fail
echo "Starting UT ..."
cd /home/zqchen/jars
./UT-datatype.sh > $THIS_HOME/ut.log &

# CRUD, Ignore中间有个hbase相关的错误
echo "Starting CRUD ..."
cd /home/zqchen/jars/UT
./runOrcCrud.sh > $THIS_HOME/crud.log &

echo "All job started!"

exit 0;

#EOF
