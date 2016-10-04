#!/bin/bash

export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export NETCDF4=1
export BUFR=1
./configure wrfplus
