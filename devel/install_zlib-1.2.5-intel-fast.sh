#!/bin/sh

export INSTDIR=/LARGE0/gr10053/b31894/lib/zlib-1.2.5-intel-fast

export CC=icc
export CXX=icpc
export CFLAGS='-O3 -xHost -fma -fPIC'
export CXXFLAGS='-O3 -xHost -fma -fPIC'
export F77=ifort
export FFLAGS='-O3 -xHost -fma -fPIC'
export CPP='icc -E'
export CXXCPP='icpc -E'

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
