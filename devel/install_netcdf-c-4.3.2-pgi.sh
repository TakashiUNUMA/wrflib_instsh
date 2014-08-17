#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.3.2-pgi

export ZLIB=/home/unuma/usr/local/zlib-1.2.8-pgi
export HDF5=/home/unuma/usr/local/hdf5-1.8.13-pgi

export CC=gcc
export CXX='gcc -E'
export CPP='gcc -E'
export CXXCPP='gcc -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

./configure --prefix=${INSTDIR} --enable-netcdf-4 --disable-dap

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
