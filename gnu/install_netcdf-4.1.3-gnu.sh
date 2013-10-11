#!/bin/sh

export CC=gcc
export CXX=g++
export F77=gfortran
export FC=gfortran
export CPP='gcc -E'
export CXXCPP='gcc -E'
export CPPFLAGS='-DNDEBUG -DpgiFortran -I/usr/local/zlib-1.2.5-gnu/include -I/usr/local/hdf5-1.8.7-gnu/include'
export LDFLAGS='-L/usr/local/zlib-1.2.5-gnu/lib -L/usr/local/hdf5-1.8.7-gnu/lib'

./configure --prefix=/usr/local/netcdf-4.1.3-gnu --disable-dap 2>&1 | tee configure.log
make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
