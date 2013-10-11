#!/bin/sh

export CC=icc
export FC=ifort

./configure --with-zlib=/usr/local/zlib-1.2.5-intel/include,/usr/local/zlib-1.2.5-intel/lib --prefix=/usr/local/hdf5-1.8.7-intel 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
