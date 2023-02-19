#!/bin/sh

export INSTDIR=/usr/local/netcdf-4.9.1-intel

export LD_LIBRARY_PATH=${INSTDIR}/lib:${LD_LIBRARY_PATH}

export CC=icx
export CXX=icx
export FC=ifort
export F77=ifort
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${INSTDIR}/include"
export LDFLAGS="-L${INSTDIR}/lib"

./configure --prefix=${INSTDIR}

make
make check
