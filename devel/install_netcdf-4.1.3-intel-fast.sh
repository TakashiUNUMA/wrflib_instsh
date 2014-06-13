#!/bin/sh

export INSTDIR=/LARGE0/gr10053/b31894/lib/netcdf-4.1.3-intel-fast

export ZLIB=/LARGE0/gr10053/b31894/lib/zlib-1.2.5-intel-fast
export HDF5=/LARGE0/gr10053/b31894/lib/hdf5-1.8.7-intel-fast

export F77=ifort
export FC=ifort
export FCFLAGS="-O3 -xHost -fma -mcmodel=large -fPIC"
export F77FLAGS="-O3 -xHost -fma -mcmodel=large -fPIC"
export F90FLAGS= #"-O3 -xHost -fma -mcmodel=large -fPIC"

export CC=icc
export CXX=icpc
export CPP='icc -E -mcmodel=large'
export CXXCPP='icpc -E -mcmodel=large'
export CFLAGS="-O3 -xHost -fma -mcmodel=large -fPIC"
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include -O3 -xHost -fma -fPIC"
export CXXFLAGS="-O3 -xHost -fma -mcmodel=large -fPIC"

export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"


./configure --prefix=${INSTDIR} --disable-dap 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
