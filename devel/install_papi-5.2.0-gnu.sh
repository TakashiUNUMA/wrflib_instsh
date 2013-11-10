#!/bin/sh

export INSTDIR=/usr/local/papi-5.1.0-gnu

export CC=gcc
export F77=gfortran
export CPP='gcc -E'
export CXXCPP='g++ -E'

./configure --prefix=${INSTDIR}

make 2>&1 | tee make.log
make test 2>&1 | tee make-test.log
make fulltest 2>&1 | tee make-fulltest.log
./run_tests.sh -v 2>&1 | tee run_tests.log

#make install
