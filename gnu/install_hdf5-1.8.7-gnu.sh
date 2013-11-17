#!/bin/sh
export CC=gcc
export FC=gfortran

./configure --with-zlib=/usr/local/zlib-1.2.5-gnu/include,/usr/local/zlib-1.2.5-gnu/lib --prefix=/usr/local/hdf5-1.8.7-gnu 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
