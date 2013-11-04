#!/bin/sh

export CC=gcc
export CXX=g++
export CPP='gcc -E'
export CXXCPP='gcc -E'
export FC=pgfortran
export F77=pgfortran

./configure --prefix=/usr/local/mpich2-1.4.1p1-pgi --enable-debuginfo --enable-fast=O3 --with-device=ch3:nemesis --with-pm=hydra 2>&1 | tee configure.log

#make 2>&1 | tee make.log
