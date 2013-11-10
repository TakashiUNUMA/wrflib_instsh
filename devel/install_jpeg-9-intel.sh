#!/bin/sh

export INSTDIR=/home/unuma/usr/local/jpeg-9-intel

export CC=icc 
export CXX=icpc 
export FC=ifort
export CFLAGS='-O3 -fma -fPIC' 
export CXXFLAGS='-O3 -fma -fPIC' 
export FFLAGS='-O3 -fma -fPIC'

./configure --prefix=${INSTDIR}

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
