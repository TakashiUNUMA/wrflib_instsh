#!/bin/sh

./configure --prefix=${HOME}/usr/local/ghostscript-9.14
make 2>&1 | tee make.log
