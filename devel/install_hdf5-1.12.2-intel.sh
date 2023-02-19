#!/bin/sh

INSTDIR=/usr/local/hdf5-1.12.2-intel

ZLIB=/usr/local/zlib-1.2.13-intel

export CC=icx
export CXX=icx
export FC=ifort

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR}

make
make check
