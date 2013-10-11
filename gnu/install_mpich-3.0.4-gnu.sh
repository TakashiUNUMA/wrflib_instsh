#!/bin/sh

export CC=gcc
export CXX=g++
export FC=gfortran
export CPP='gcc -E'
export CXXCPP='gcc -E'

./configure --prefix=/usr/local/mpich-3.0.4-gnu --enable-debuginfo --enable-shared --enable-fast=O3 --with-device=ch3:nemesis 2>&1 | tee configure.log
make 2>&1 | tee make.log
