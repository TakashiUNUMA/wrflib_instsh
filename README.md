wrflib_instsh
=============

# Description

Shell scripts for installing libraries in order to compile the WRF model. 

GNU, Intel and PGI compilers are supported. 

More detail, please see HowToUse.txt.


# NOTE
Shell scripts in "devel" directory are under instruction so that the use of these scripts are not recommended.


# Verification Environments

1. CentOS 5.9 (x86_64)
- gcc, g++, and gfortran ver. 4.4.7
- icc, icpc, and ifort ver. 12.1.4
- NetCDF ver. 3.6.3 (GNU and Intel compiler)
- NetCDF ver. 4.1.3, compiling with HDF5 ver. 1.8.7 and ZLIB ver. 1.2.5 (GNU and Intel compiler)
- NetCDF-C ver. 4.3.2 and NetCDF-Fortran ver. 4.4.0, compiling with HDF5 ver. 1.8.13 and ZLIB ver. 1.2.8 (GNU and Intel compiler)

2. CentOS 6.5 (x86_64)
- gcc, g++, and gfortran ver. 4.4.6
- pgfortran ver. 12.10 (CC and CPP used as gcc and g++, respecctively)
-- NetCDF ver. 3.6.3 (GNU and PGI compiler)
-- NetCDF ver. 4.1.3, compiling with HDF5 ver. 1.8.7 and ZLIB ver. 1.2.5 (GNU and PGI compiler)
-- NetCDF-C ver. 4.3.2 and NetCDF-Fortran ver. 4.4.0, compiling with HDF5 ver. 1.8.13 and ZLIB ver. 1.2.8 (PGI compiler)

3. Ubuntu 14.04 (64-bit)
- gcc, g++, and gfortran ver. 4.8.2
- icc, icpc, and ifort ver. 14.0.2
-- NetCDF ver. 3.6.3 (GNU and Intel compiler)
-- NetCDF ver. 4.1.3, compiling with HDF5 ver. 1.8.7 and ZLIB ver. 1.2.8 (GNU and Intel compiler)
-- NetCDF-C ver. 4.3.2 and NetCDF-Fortran ver. 4.4.0, compiling with HDF5 ver. 1.8.13 and ZLIB ver. 1.2.8 (GNU and Intel compiler)
