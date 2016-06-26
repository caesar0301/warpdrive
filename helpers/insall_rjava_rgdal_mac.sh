
#!/bin/bash

# Install rJava on Mac
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA_CPPFLAGS=-I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers/
R CMD javareconf
echo "install.package('rJava')" | R --no-save

# Install rgdal on Mac
install.packages('rgeos', type="source")
install.packages('rgdal', type = "source", configure.args=c('--with-proj-include=/usr/local/include','--with-proj-lib=/usr/local/lib'))
