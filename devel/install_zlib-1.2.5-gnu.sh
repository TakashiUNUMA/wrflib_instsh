#!/bin/sh

export INSTDIR=/home/unumausr/local/zlib-1.2.5-gnu

export CC=gcc
export CXX=g++
export CFLAGS='-fpic'
export CXXFLAGS='-fpic'
export F77=gfortran
export FFLAGS='-fpic'
export CPP='gcc -E'
export CXXCPP='gcc -E'

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee makecheck.log
