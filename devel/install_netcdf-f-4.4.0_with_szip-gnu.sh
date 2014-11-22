#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.3.2_with_szip-gnu

export ZLIB=/home/unuma/usr/local/zlib-1.2.8-gnu
export SZIP=/home/unuma/usr/local/szip-2.1-gnu
export HDF5=/home/unuma/usr/local/hdf5-1.8.13_with_szip-gnu

export LD_LIBRARY_PATH=${INSTDIR}/lib:${LD_LIBRARY_PATH}

export F77=gfortran
export FC=gfortran
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${SZIP}/include -I${HDF5}/include -I${INSTDIR}/include"
export LDFLAGS="-L${ZLIB}/lib -L${SZIP}/lib -L${HDF5}/lib -L${INSTDIR}/lib"

./configure --prefix=${INSTDIR}

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
