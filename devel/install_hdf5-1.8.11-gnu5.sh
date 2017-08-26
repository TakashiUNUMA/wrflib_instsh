#!/bin/sh

export INSTDIR=/home/unuma/build/gfortran5/libs

export ZLIB=${INSTDIR}

export CC=gcc-5
export FC=gfortran-5

./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR} --enable-fortran --enable-cxx

make 
make check 
make install
make check-install
