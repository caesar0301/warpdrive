# Shell font configuration in terminal
# Menlo, 14 pt.

# Get parent directory
base_dir=$(dirname $0)/..

# Linux and mac
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})

# Check value
if [ "x$LOG_DIR" = "x" ]; then
    LOG_DIR="$base_dir/logs"
fi

# Check direcotry
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# Check file
if [ -f "$file" ]; then
	echo "$file found."
else
	echo "$file not found."
fi

# Add multiple java class paths
for file in $base_dir/core/build/dependant-libs-${SCALA_VERSION}*/*.jar;
do
  CLASSPATH=$CLASSPATH:$file
done

# Check which java to use
if [ -z "$JAVA_HOME" ]; then
  JAVA="java"
else
  JAVA="$JAVA_HOME/bin/java"
fi

# Create alias of commands
unalias hfs &> /dev/null
alias hfs="hadoop fs"

# check OS type as Darwin, Linux, or Cygwin
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
fi

# check if process is running
ps cax | grep httpd > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  echo "Process is not running."
fi
