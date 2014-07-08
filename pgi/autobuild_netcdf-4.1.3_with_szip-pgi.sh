#!/bin/sh

export http_proxy=http://proxy.kuins.net:8080/
export https_proxy=http://proxy.kuins.net:8080/
export ftp_proxy=http://proxy.kuins.net:8080/

wget -nc ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.1.3.tar.gz
wget -nc http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.7/src/hdf5-1.8.7.tar.gz
wget -nc https://github.com/madler/zlib/archive/v1.2.5.tar.gz -O zlib-1.2.5.tar.gz
wget -nc http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz

# build zlib
if test ! -s zlib-1.2.5.tar.gz ; then
    echo "Error: zlib-1.2.5.tar.gz is not found"
    exit 100
fi
tar -zxvf zlib-1.2.5.tar.gz
cd zlib-1.2.5
pwd
export INSTDIR=/home/unuma/usr/local/zlib-1.2.5-pgi
export CC=gcc
export CXX=g++
export CFLAGS='-fpic'
export CXXFLAGS='-fpic'
export F77=pgf77
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
export ZLIB="/home/unuma/usr/local/zlib-1.2.5-pgi"
export LD_LIBRARY_PATH="${ZLIB}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${ZLIB}/include:${INCLUDE}"


# build szip
if test ! -s szip-2.1.tar.gz ; then
    echo "Error: szip-2.1.tar.gz is not found"
    exit 200
fi
tar -zxvf szip-2.1.tar.gz
cd szip-2.1
pwd
export INSTDIR=/home/unuma/usr/local/szip-2.1-pgi
export CC=gcc
export FC=pgfortran
./configure --prefix=${INSTDIR}
make
make check
make install
cd ../
pwd

### SZIP
export SZIP="/home/unuma/usr/local/szip-2.1-pgi"
export PATH="${SZIP}/bin:${PATH}"
export LD_LIBRARY_PATH="${SZIP}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${SZIP}/include:${INCLUDE}"
export MANPATH="${SZIP}/man:${MANPATH}"


# build hdf5
if test ! -s hdf5-1.8.7.tar.gz ; then
    echo "Error: hdf5-1.8.7.tar.gz is not found"
    exit 200
fi
tar -zxvf hdf5-1.8.7.tar.gz
cd hdf5-1.8.7
pwd
export INSTDIR=/home/unuma/usr/local/hdf5-1.8.7_with_szip-pgi
export ZLIB=/home/unuma/usr/local/zlib-1.2.5-pgi
export SZIP=/home/unuma/usr/local/szip-2.1-pgi
CC=gcc FC=pgf90 ./configure --with-zlib=${ZLIB}/include,${ZLIB}/lib --with-szlib=${SZIP} --prefix=${INSTDIR}
make
make check
make install
make check-install
cd ../
pwd

### HDF
export HDF="/home/unuma/usr/local/hdf5-1.8.7_with_szip-pgi"
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
export INSTDIR=/home/unuma/usr/local/netcdf-4.1.3_with_szip-pgi
export ZLIB=/home/unuma/usr/local/zlib-1.2.5-pgi
export SZIP=/home/unuma/usr/local/szip-2.1-pgi
export HDF5=/home/unuma/usr/local/hdf5-1.8.7_with_szip-pgi
export CC=gcc
export CXX=g++
export FC=pgf90
export F77=pgf77
export F90=pgf90
export F95=pgf95
export FFLAGS='-O2 -w -V -Msignextend'
export CPPFLAGS="-DpgiFortran -I${ZLIB}/include -I${SZIP}/include -I${HDF5}/include"
export LDFLAGS="-L${ZLIB}/lib -L${HDF5}/lib -L${HDF5}/lib"
./configure --prefix=${INSTDIR} --disable-dap #--enable-shared
make
make check
make install

### NetCDF
export NETCDF="/home/unuma/usr/local/netcdf-4.1.3_with_szip-pgi"
export NCHOME="${NETCDF}"
export NETCDFHOME="${NETCDF}"
export PATH="${NETCDF}/bin:${PATH}"
export LD_LIBRARY_PATH="${NETCDF}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${NETCDF}/include:${INCLUDE}"
export MANPATH="${NETCDF}/man:${MANPATH}"

# --- 
