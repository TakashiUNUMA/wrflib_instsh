#!/bin/sh

export INSTDIR=/usr/local/hdf5-1.8.12-pgi

export ZLIB=/usr/local/zlib-1.2.8-pgi

export CC=gcc
export FC=pgf90

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR} 2>&1 | tee configure.log

make check 2>&1 | tee makecheck.log
make 2>&1 | tee make.log
