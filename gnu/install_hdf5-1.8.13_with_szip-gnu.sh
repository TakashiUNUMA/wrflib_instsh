#!/bin/sh

export INSTDIR=/usr/local/hdf5-1.8.13_with_szip-gnu
export ZLIB=/usr/local/zlib-1.2.8-gnu
export SZIP=/usr/local/szip-2.1-gnu

# for check
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${SZIP}/lib

CC=gcc FC=gfortran ./configure --enable-fortran --enable-cxx --with-zlib=${ZLIB}/include,${ZLIB}/lib --with-szlib=${SZIP} --prefix=${INSTDIR}

make
make check

#make install
#make check-install
