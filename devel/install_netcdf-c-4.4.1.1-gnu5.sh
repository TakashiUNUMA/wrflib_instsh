#!/bin/sh

export INSTDIR=/home/unuma/build/gfortran5/libs

export ZLIB=/home/unuma/build/gfortran5/libs
export HDF5=/home/unuma/build/gfortran5/libs

export CC=gcc-5
export CXX=g++-5
export CPP='gcc-5 -E'
export CXXCPP='gcc-5 -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

CPPFLAGS=${CPPFLAGS} LDFLAGS=${LDFLAGS} ./configure --prefix=${INSTDIR} --enable-netcdf-4 --disable-dap

make
make check
make install
