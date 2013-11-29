#!/bin/sh

export INSTDIR=/home/unuma/usr/local/zlib-1.2.5-pgi

export CC=gcc
export CXX=g++
export CFLAGS='-fpic'
export CXXFLAGS='-fpic'
export F77=pgf77
export FFLAGS='-fpic'
export CPP='gcc -E'
export CXXCPP='gcc -E'

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make check 2>&1 | tee makecheck.log
make 2>&1 | tee make.log

