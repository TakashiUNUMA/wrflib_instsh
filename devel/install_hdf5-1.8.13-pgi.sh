#!/bin/sh

export INSTDIR=/home/unuma/usr/local/hdf5-1.8.13-pgi

export ZLIB=/home/unuma/usr/local/zlib-1.2.8-pgi

export CC=gcc
export FC=pgfortran

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR}

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
