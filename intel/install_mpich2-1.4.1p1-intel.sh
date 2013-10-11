#!/bin/sh

export CC=icc
export CXX=icpc
export FC=ifort
export CPP='icc -E'
export CXXCPP='icc -E'

./configure --prefix=/home/unuma/usr/local/mpich2-1.4.1p1-intel --enable-debuginfo --enable-fast=O3 --with-device=ch3:nemesis 2>&1 | tee configure.log
make 2>&1 | tee make.log
