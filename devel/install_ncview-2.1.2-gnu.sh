#!/bin/sh

export INSTDIR=/home/unuma/usr/local/ncview-2.1.2-gnu
export NETCDF4=/home/unuma/usr/local/netcdf-4.1.3-gnu
export UDUNITS=/home/unuma/usr/local/udunits-2.1.24-gnu

./configure --prefix=${INSTDIR} --with-nc-config=${NETCDF4}/bin/nc-config --with-udunits2_incdir=${UDUNITS}/include --with-udunits2_libdir=${UDUNITS}/lib

make 2>&1 | tee make.log
