#!/bin/sh

export INSTDIR=/home/unuma/usr/local/mpich2-1.4.1p1-gnu

export CC=gcc
export CXX=g++
export CPP='gcc -E'
export CXXCPP='gcc -E'
export FC=gfortran
export F77=gfortran

./configure --prefix=${INSTDIR} --enable-debuginfo --enable-fast=O3 --with-device=ch3:nemesis --with-pm=hydra 2>&1 | tee configure.log

make 2>&1 | tee make.log

