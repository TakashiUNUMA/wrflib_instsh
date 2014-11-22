#!/bin/sh

export INSTDIR=/home/unuma/usr/local/szip-2.1-gnu
export CC=gcc
export FC=gfortran
./configure --prefix=${INSTDIR}
make
make check
#make install
