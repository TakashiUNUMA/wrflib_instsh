#!/bin/sh

export INSTDIR=/usr/local/zlib-1.2.13-intel

export CC=icx
export CXX=icx
export CFLAGS='-fPIC'
export CXXFLAGS='-fPIC'
export F77=ifort
export FFLAGS='-fPIC'
export CPP='icx -E'
export CXXCPP='icx -E'

./configure --prefix=${INSTDIR}

make
make check
