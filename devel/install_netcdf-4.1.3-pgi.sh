#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.1.3-pgi

export ZLIB=/home/unuma/usr/local/zlib-1.2.5-pgi
export HDF5=/home/unuma/usr/local/hdf5-1.8.7-pgi

export CC=gcc
export CXX=g++
export CPPFLAGS="-DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

export FC=pgf90
export F77=pgf77
export F90=pgf90
export F95=pgf95
export FFLAGS='-O2 -w -V -Msignextend'

./configure --prefix=${INSTDIR} --disable-dap --enable-shared 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
