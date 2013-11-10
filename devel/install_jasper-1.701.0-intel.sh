#!/bin/sh

export INSTDIR=/home/unuma/usr/local/jasper-1.701.0-intel

export CC=icc
export CXX=icpc
export FC=ifort
export F77=ifort
export F90=ifort

./configure --prefix=${INSTDIR} 2>&1 | tee configure.log

make 2>&1 | tee make.log
