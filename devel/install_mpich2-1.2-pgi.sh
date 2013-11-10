#!/bin/sh

export INSTDIR=/home/unuma/usr/local/mpich2-1.2-pgi

export CC=gcc
export CXX=g++
export F77=pgfortran
export F90=pgfortran
export CPP='gcc -E'
export CXXCPP='gcc -E'

./configure --prefix=${INSTDIR} --enable-debuginfo --with-device=ch3:nemesis 2>&1 | tee configure.log

make 2>&1 | tee make.log
