#!/bin/sh

export INSTDIR=/home/unuma/usr/local/jasper-1.900.1-gnu

export CC=gcc
export CXX='gcc -E'
export FC=gfortran
export F77=gfortran
export F90=gfortran

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
