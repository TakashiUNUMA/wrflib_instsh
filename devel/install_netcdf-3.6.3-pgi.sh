#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-3.6.3-pgi

export CC=gcc
export CFLAGS=''
#export CXX=g++
export CXX='gcc -E'
export CPPFLAGS='-DNDEBUG -DpgiFortran'
export FC=pgf90
export F90=pgf90
export F95=pgf95
export F77=pgf77
export FFLAGS='-O2 -w -V -Msignextend'

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
make check
make test


##### old
#export FC=pgf90
#export CC=pgcc
#export CPP=cpp
#export CXX=
#export CPPFLAGS='-DpgiFortran'

#export FC=pgf90
#export F90=pgf90
#export FFLAGS="-O2 -w -V"
#export CC=pgcc
#export CFLAGS="-O2 -Msignextend -V"
#export CXX=pgCC
#export CPPFLAGS="-DNDEBUG -DpgiFortran"
