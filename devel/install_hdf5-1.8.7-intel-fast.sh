#!/bin/sh

INSTDIR=/LARGE0/gr10053/b31894/lib/hdf5-1.8.7-intel-fast

ZLIB=/LARGE0/gr10053/b31894/lib/zlib-1.2.5-intel-fast

export CC=icc
export FC=ifort
export CFLAGS='-O3 -xHost -fma -fPIC'
export FCFLAGS='-O3 -xHost -fma -fPIC'

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
