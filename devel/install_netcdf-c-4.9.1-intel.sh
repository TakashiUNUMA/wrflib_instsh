#!/bin/sh

export INSTDIR=/usr/local/netcdf-4.9.1-intel

export ZLIB=/usr/local/zlib-1.2.13-intel
export HDF5=/usr/local/hdf5-1.12.2-intel

CC=icx CXX=icx F77=ifort FC=ifort CPP='icx -E' CXXCPP='icx -E' CPPFLAGS="-I${ZLIB}/include -I${HDF5}/include" LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib" ./configure --prefix=${INSTDIR} --disable-dap-remote-tests --disable-libxml2

make
make check
