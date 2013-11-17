#!/bin/sh

export INSTDIR=/home/unuma/usr/local/hdf5-1.8.7-gnu

export ZLIB=/home/unuma/usr/local/zlib-1.2.5-gnu

export CC=gcc
export FC=gfortran

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log

