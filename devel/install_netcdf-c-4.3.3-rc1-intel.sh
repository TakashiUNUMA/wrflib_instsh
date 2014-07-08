#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.3.3-rc1-intel

export ZLIB=/home/unuma/usr/local/zlib-1.2.5-intel
export HDF5=/home/unuma/usr/local/hdf5-1.8.7-intel

export CC=icc
export CXX=icpc
#export F77=ifort
#export FC=ifort
export CPP='icc -E'
export CXXCPP='icpc -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

./configure --prefix=${INSTDIR} --disable-dap 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
