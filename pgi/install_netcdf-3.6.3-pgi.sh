#!/bin/sh

export FC=pgf90
export CC=pgcc
export CPP=cpp
export CXX=
export CPPFLAGS='-DpgiFortran'

#export CC=gcc
#export CFLAGS=''
#export CXX=g++
#export CPPFLAGS='-DNDEBUG -DpgiFortran'
#export FC=pgf90
#export F90=pgf90
#export F95=pgf95
#export F77=pgf77
#export FFLAGS='-O2 -w -V -Msignextend'

#export FC=pgf90
#export F90=pgf90
#export FFLAGS="-O2 -w -V"
#export CC=pgcc
#export CFLAGS="-O2 -Msignextend -V"
#export CXX=pgCC
#export CPPFLAGS="-DNDEBUG -DpgiFortran"

./configure --prefix=/usr/local/netcdf-3.6.3-pgi 2>&1 | tee configure.log
make 2>&1 | tee make.log
