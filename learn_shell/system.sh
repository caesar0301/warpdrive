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

# free memory
# To free pagecache:
echo 1 > /proc/sys/vm/drop_caches
# To free dentries and inodes:
echo 2 > /proc/sys/vm/drop_caches
# To free pagecache, dentries and inodes:
echo 3 > /proc/sys/vm/drop_caches
