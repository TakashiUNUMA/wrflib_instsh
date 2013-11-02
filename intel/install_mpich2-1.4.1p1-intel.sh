#!/bin/sh

export CC=icc
export CXX=icpc
export CPP='icc -E'
export CXXCPP='icc -E'
export FC=ifort
export F77=ifort

./configure --prefix=/home/unuma/usr/local/mpich2-1.4.1p1-intel --enable-debuginfo --enable-fast=O3 --with-device=ch3:nemesis --with-pm=hydra 2>&1 | tee configure.log
make 2>&1 | tee make.log
