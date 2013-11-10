#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-3.6.3-gnu

export FC=gfortran
export F77=gfortran
export CC=gcc
export CXX=g++
export CPP='gcc -E'
export CXXCPP='gcc -E'
export CPPFLAGS='-DNDEBUG -DpgiFortran'

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check
make test
