#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.1.3-gnu

export ZLIB=/home/unuma/usr/local/zlib-1.2.5-gnu
export HDF5=/home/unuma/usr/local/hdf5-1.8.7-gnu

export CC=gcc
export CXX=g++
export F77=gfortran
export FC=gfortran
export CPP='gcc -E'
export CXXCPP='gcc -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

./configure --prefix=${INSTDIR} --disable-dap 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
