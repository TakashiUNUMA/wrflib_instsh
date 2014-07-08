#!/bin/sh

./configure --prefix=/home/unuma/usr/local/parallel-20140522
make 2>&1 | tee make.log
