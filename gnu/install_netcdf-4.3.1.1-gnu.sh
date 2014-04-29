#!/bin/sh

export INSTDIR=/usr/local/netcdf-4.3.1.1-gnu

export ZLIB=/usr/local/zlib-1.2.8-gnu
export HDF5=/usr/local/hdf5-1.8.12-gnu

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
