#!/bin/sh
export CC=gcc
export CXX=g++
export CFLAGS='-fpic'
export CXXFLAGS='-fpic'
export F77=gfortran
export FFLAGS='-fpic'
export CPP='gcc -E'
export CXXCPP='gcc -E'

./configure --prefix=/usr/local/zlib-1.2.5-gnu 2>&1 | tee configure.log

make check 2>&1 | tee makecheck.log
make 2>&1 | tee make.log

