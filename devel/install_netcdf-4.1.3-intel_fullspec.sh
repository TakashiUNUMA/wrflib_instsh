#!/bin/sh

export INSTDIR=/home/unuma/usr/local/netcdf-4.1.3-intel

export ZLIB=/home/unuma/usr/local/zlib-1.2.5-intel
export SZIP=/home/unuma/usr/local/szip-2.1-intel
export HDF5=/home/unuma/usr/local/hdf5-1.8.7-intel

#--- part 1: 

export CC=icc
export CXX=icpc
export FC=ifort
export F77=ifort
export F90=ifort

export CFLAGS="-O3 -fma -mcmodel=large -fPIC"
export CXXFLAGS="-O3 -fma -mcmodel=large -fPIC"
export FCFLAGS="-O3 -fma -mcmodel=large -fPIC"
export F77FLAGS="-O3 -fma -mcmodel=large -fPIC"
export F90FLAGS="-O3 -fma -mcmodel=large -fPIC"

export CPP='icc -E -mcmodel=large'
export CXXCPP='icpc -E -mcmodel=large'
export CPPFLAGS="-DNDEBUG -DpgiFortran ${LDFLAGS}"

./configure --prefix=${INSTDIR} --enable-shared --disable-netcdf-4 --disable-dap

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
make install
wait 10

#--- part 2: 

export LD_LIBRARY_PATH="${HDF5}/lib:${LD_LIBRARY_PATH}"
export LDFLAGS="-L${HDF5}/lib -I${HDF5}/include"

export CC=icc
export CXX=icpc
export FC=ifort
export F77=ifort
export F90=ifort

export CFLAGS="-O3 -fma -mcmodel=large -fPIC"
export CXXFLAGS="-O3 -fma -mcmodel=large -fPIC"
export FCFLAGS="-O3 -fma -mcmodel=large -fPIC"
export F77FLAGS="-O3 -fma -mcmodel=large -fPIC"
export F90FLAGS="-O3 -fma -mcmodel=large -fPIC"

export CPP='icc -E -mcmodel=large'
export CXXCPP='icpc -E -mcmodel=large'
export CPPFLAGS="-DNDEBUG -DpgiFortran ${LDFLAGS}"

./configure --prefix=${INSTDIR} --with-hdf5=${HDF5} --with-zlib=${ZLIB} --with-szlib=${SZIP} --enable-shared --enable-netcdf-4 --enable-dap --disable-fortran --disable-cxx

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
make install


# old
#export CC=icc
#export CXX=icpc
#export F77=ifort
#export FC=ifort
#export CPP='icc -E'
#export CXXCPP='icpc -E'
#export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
#export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"

#./configure --prefix=${INSTDIR} --disable-dap 2>&1 | tee configure.log

#make 2>&1 | tee make.log
#make check 2>&1 | tee make-check.log
