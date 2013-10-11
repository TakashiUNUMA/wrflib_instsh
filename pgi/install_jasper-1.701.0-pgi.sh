#!/bin/sh

export CC=gcc
export CXX='gcc -E'
export FC=pgfortran
export F77=pgfortran
export F90=pgfortran

./configure --prefix=/usr/local/jasper-1.701.0-pgi 2>&1 | tee configure.log
make 2>&1 | tee make.log
