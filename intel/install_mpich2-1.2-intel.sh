#!/bin/sh

export CC=icc
export CXX=icpc
export F77=ifort
export F90=ifort
export CPP='icc -E'
export CXXCPP='icc -E'

./configure --prefix=/usr/local/mpich2-1.2-intel --enable-debuginfo --with-device=ch3:nemesis 2>&1 | tee configure.log
make 2>&1 | tee make.log
