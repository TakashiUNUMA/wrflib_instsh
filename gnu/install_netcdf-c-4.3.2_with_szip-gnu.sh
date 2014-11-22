#!/bin/sh

export INSTDIR=/usr/local/netcdf-4.3.2_with_szip-gnu

export ZLIB=/usr/local/zlib-1.2.8-gnu
export SZIP=/usr/local/szip-2.1-gnu
export HDF5=/usr/local/hdf5-1.8.13_with_szip-gnu

export CC=gcc
export CXX=g++
export CPP='gcc -E'
export CXXCPP='gcc -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${SZIP}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${SZIP}/lib -L${HDF5}/lib"

./configure --prefix=${INSTDIR} --enable-netcdf-4 --disable-dap

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
