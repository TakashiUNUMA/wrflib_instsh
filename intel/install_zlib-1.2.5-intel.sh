#!/bin/sh

INSTDIR=/home/unuma/usr/local/zlib-1.2.5-intel

export CC=icc
export CXX=icpc
export CFLAGS='-fPIC'
export CXXFLAGS='-fPIC'
export F77=ifort
export FFLAGS='-fPIC'
export CPP='icc -E'
export CXXCPP='icpc -E'

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
