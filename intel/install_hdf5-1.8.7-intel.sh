#!/bin/sh

INSTDIR=/usr/local/hdf5-1.8.7-intel

ZLIB=/usr/local/zlib-1.2.5-intel

export CC=icc
export FC=ifort

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR} 2>&1 | tee configure.log

make libs progs 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
