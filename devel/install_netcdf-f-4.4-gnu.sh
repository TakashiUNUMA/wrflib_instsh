#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.3.2-gnu

export LD_LIBRARY_PATH=${INSTDIR}/lib:${LD_LIBRARY_PATH}

export F77=gfortran
export FC=gfortran
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${INSTDIR}/include"
export LDFLAGS="-L${INSTDIR}/lib"

./configure --prefix=${INSTDIR}

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
