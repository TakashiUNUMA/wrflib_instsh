#!/bin/sh

#export http_proxy=http://proxy.kuins.net:8080/
#export https_proxy=http://proxy.kuins.net:8080/
#export ftp_proxy=http://proxy.kuins.net:8080/

#wget -nc ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.1.3.tar.gz
#wget -nc http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.7/src/hdf5-1.8.7.tar.gz
#wget -nc https://github.com/madler/zlib/archive/v1.2.5.tar.gz -O zlib-1.2.5.tar.gz

# build zlib
if test ! -s zlib-1.2.5.tar.gz ; then
    echo "Error: zlib-1.2.5.tar.gz is not found"
    exit 100
fi
tar -zxvf zlib-1.2.5.tar.gz
cd zlib-1.2.5
pwd
export INSTDIR=${HOME}/usr/local/zlib-1.2.5-gnu
export CC=gcc
export CXX=g++
export CFLAGS='-fpic'
export CXXFLAGS='-fpic'
export F77=gfortran
export FFLAGS='-fpic'
export CPP='gcc -E'
export CXXCPP='gcc -E'
./configure --prefix=${INSTDIR}
make
make check
make install
cd ../
pwd

### ZLIB
export ZLIB="${HOME}/usr/local/zlib-1.2.5-gnu"
export LD_LIBRARY_PATH="${ZLIB}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${ZLIB}/include:${INCLUDE}"


# build hdf5
if test ! -s hdf5-1.8.7.tar.gz ; then
    echo "Error: hdf5-1.8.7.tar.gz is not found"
    exit 200
fi
tar -zxvf hdf5-1.8.7.tar.gz
cd hdf5-1.8.7
pwd
export INSTDIR=${HOME}/usr/local/hdf5-1.8.7-gnu
export ZLIB=${HOME}/usr/local/zlib-1.2.5-gnu
CC=gcc FC=gfortran ./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --prefix=${INSTDIR}
make #libs progs
make check
make install
cd ../
pwd

### HDF
export HDF="${HOME}/usr/local/hdf5-1.8.7-gnu"
export PATH="${HDF}/bin:${PATH}"
export LD_LIBRARY_PATH="${HDF}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${HDF}/include:${INCLUDE}"
export MANPATH="${HDF}/man:${MANPATH}"


# build netcdf
if test ! -s netcdf-4.1.3.tar.gz ; then
    echo "Error: netcdf-4.1.3.tar.gz is not found"
    exit 300
fi
tar -zxvf netcdf-4.1.3.tar.gz
cd netcdf-4.1.3
pwd
# --- 
export INSTDIR=${HOME}/usr/local/netcdf-4.1.3-gnu
export ZLIB=${HOME}/usr/local/zlib-1.2.5-gnu
export HDF5=${HOME}/usr/local/hdf5-1.8.7-gnu
export CC=gcc
export CXX=g++
export F77=gfortran
export FC=gfortran
export CPP='gcc -E'
export CXXCPP='g++ -E'
export CPPFLAGS="-DNDEBUG -DpgiFortran -I${ZLIB}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib"
./configure --prefix=${INSTDIR} --disable-dap
make
make check
make install
cd ../
pwd

### NetCDF
export NETCDF="${HOME}/usr/local/netcdf-4.1.3-gnu"
export NCHOME="${NETCDF}"
export NETCDFHOME="${NETCDF}"
export PATH="${NETCDF}/bin:${PATH}"
export LD_LIBRARY_PATH="${NETCDF}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${NETCDF}/include:${INCLUDE}"
export MANPATH="${NETCDF}/man:${MANPATH}"

# --- 
