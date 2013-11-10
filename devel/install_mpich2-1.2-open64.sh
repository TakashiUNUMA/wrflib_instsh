#!/bin/sh
export CC=opencc
export CXX=openCC
export FC=openf90
#export CPP='gcc -E'
#export CXXCPP='gcc -E'

./configure --prefix=/home/unuma/usr/local/mpich2-1.2-open64 --enable-debuginfo --enable-fast=O3 --with-device=ch3:nemesis 2>&1 | tee configure.log
make 2>&1 | tee make.log

