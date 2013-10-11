#!/bin/sh

export ZLIB=/usr/local/zlib-1.2.5-intel
export HDF5=/usr/local/hdf5-1.8.7-intel

export CC=icc
export CXX=icpc
export F77=ifort
export FC=ifort
export CPP='icc -E'
export CXXCPP='icpc -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

./configure --prefix=/usr/local/netcdf-4.1.3-intel --disable-dap 2>&1 | tee configure.log
make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
