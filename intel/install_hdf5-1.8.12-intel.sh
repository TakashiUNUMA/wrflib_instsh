#!/bin/sh

INSTDIR=/usr/local/hdf5-1.8.12-intel

ZLIB=/usr/local/zlib-1.2.8-intel

export CC=icc
export FC=ifort

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
