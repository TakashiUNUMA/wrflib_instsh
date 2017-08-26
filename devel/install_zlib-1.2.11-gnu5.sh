#!/bin/sh

export INSTDIR=/home/unuma/build/gfortran5/libs

export CC=gcc-5
export CXX=g++-5
export CFLAGS='-fpic'
export CXXFLAGS='-fpic'
export F77=gfortran-5
export FFLAGS='-fpic'
export CPP='gcc-5 -E'
export CXXCPP='gcc-5 -E'

./configure --prefix=${INSTDIR}

make test
make install
