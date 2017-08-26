#!/bin/sh

export INSTDIR=/home/unuma/build/gfortran5/libs

export ZLIB=/home/unuma/build/gfortran5/libs
export HDF5=/home/unuma/build/gfortran5/libs

export LD_LIBRARY_PATH=${INSTDIR}/lib:${LD_LIBRARY_PATH}

export F77=gfortran-5
export FC=gfortran-5
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include -I${INSTDIR}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib -L${INSTDIR}/lib"

CPPFLAGS=${CPPFLAGS} LDFLAGS=${LDFLAGS} ./configure --prefix=${INSTDIR}

make
make check
make install
