#! /bin/bash

GCC_VERSION="5.2.0"
WORKDIR="$HOME/src/"
INSTALLDIR="/platform"

## NOTE: XCode must be installed (through App Store) and the following run to install command-line tools.
## THIS IS IMPORTANT! Among other things, it creates '/usr/include' and installs the system header files.
# xcode-select --install

# get the source code
cd $WORKDIR
wget http://www.netgull.com/gcc/releases/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.bz2
tar -xf gcc-${GCC_VERSION}.tar.bz2

# download the prerequisites
cd gcc-${GCC_VERSION}
./contrib/download_prerequisites

# create the build directory
cd ..
mkdir gcc-build
cd gcc-build

# build
../gcc-${GCC_VERSION}/configure                      \
    --prefix=${INSTALLDIR}                           \
    --enable-shared                                  \
    --enable-threads=posix                           \
    --enable-__cxa_atexit                            \
    --enable-clocale=gnu                             \
    --enable-languages=all                           \
&& make \
&& make install

# Notes
#
#   --enable-shared --enable-threads=posix --enable-__cxa_atexit: 
#       These parameters are required to build the C++ libraries to published standards.
#   
#   --enable-clocale=gnu: 
#       This parameter is a failsafe for incomplete locale data.
#   
#   --disable-multilib: 
#       This parameter ensures that files are created for the specific
#       architecture of your computer.
#        This will disable building 32-bit support on 64-bit systems where the
#        32 bit version of libc is not installed and you do not want to go
#        through the trouble of building it. Diagnosis: "Compiler build fails
#        with fatal error: gnu/stubs-32.h: No such file or directory"
#   
#   --with-system-zlib: 
#       Uses the system zlib instead of the bundled one. zlib is used for
#       compressing and uncompressing GCC's intermediate language in LTO (Link
#       Time Optimization) object files.
#   
#   --enable-languages=all
#   --enable-languages=c,c++,fortran,go,objc,obj-c++: 
#       This command identifies which languages to build. You may modify this
#       command to remove undesired language
