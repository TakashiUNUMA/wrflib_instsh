#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.3.3.1-gnu

export LD_LIBRARY_PATH=${INSTDIR}/lib:${LD_LIBRARY_PATH}

export F77=/usr/bin/gfortran44
export FC=/usr/bin/gfortran44
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${INSTDIR}/include"
export LDFLAGS="-L${INSTDIR}/lib"

./configure --prefix=${INSTDIR}

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
