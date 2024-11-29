# Shell font configuration in terminal
# Menlo, 14 pt.

# Linux and mac, abspath
THISFILE=$(cd ${0%/*} && echo $PWD/${0##*/})
THISDIR=$(dirname $THISFILE)

# Get parent directory
base_dir=$(dirname $0)/..

# trapped temp dir
TEMP_DIR="$( mktemp -d )"
trap 'rm -rf ${TEMP_DIR}' EXIT

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

# Check command existence
type foobar &> /dev/null
hash foobar &> /dev/null
command -v foobar &> /dev/null
which foobar &> /dev/null
(( $+commands[foobar] )) # (zsh only)

testing-command && echo exist || echo non-exist
