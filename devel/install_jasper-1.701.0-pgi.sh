#!/bin/sh

export INSTDIR=/home/unuma/usr/local/jasper-1.701.0-pgi

export CC=gcc
export CXX='gcc -E'
export FC=pgfortran
export F77=pgfortran
export F90=pgfortran

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
