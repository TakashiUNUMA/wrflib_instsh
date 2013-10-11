#!/bin/sh
export CC=gcc
export CXX=g++
export FC=gfortran
export CPP='gcc -E'
export CXXCPP='gcc -E'

./configure --prefix=/usr/local/mpich2-1.4.1p1-gnu --enable-debuginfo --enable-fast=O3 --with-device=ch3:nemesis 2>&1 | tee configure.log

#make 2>&1 | tee make.log

