# Copy this function to ~/.bashrc or ~/.profile
function spark-submit2() {
    spark-submit \
        --master spark://namenode.omnilab.sjtu.edu.cn:7077 \
        --deploy-mode client \
        --driver-memory 2G \
        --executor-memory 4G \
        --executor-cores 4 \
        --num-executors 8 $@
}

# Another pyspark starter to be enhanced with IPyhton Notebook
function pyspark2(){
    PORT=$1
    NOTEBOOK_DIR=$2
    if [  -z "$1" ]; then
        echo "Using default port 9999 ..."
        PORT=9999
    else
        echo "Using port $PORT ..."
    fi
    if [  -z "$2" ]; then
        echo "Using default notebook_dir ..."
    else
        echo "Using notebook_dir: $NOTEBOOK_DIR ..."
        mkdir -p $NOTEBOOK_DIR
    fi
    export IPYTHON=1
    export IPYTHON_OPTS="notebook --ip=0.0.0.0 --port=$PORT --notebook-dir=$NOTEBOOK_DIR --matplotlib=inline --no-browser --quiet"
    export SPARK_MASTER="spark://namenode.omnilab.sjtu.edu.cn:7077"
    pyspark --master $SPARK_MASTER --deploy-mode client $* --driver-memory 4G --executor-memory 4G --num-executors 32 --total-executor-cores 24
}
