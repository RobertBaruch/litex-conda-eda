#!/bin/bash

set -x
set -e

mkdir build
cd build
../configure \
  --prefix=$PREFIX \

make -j$CPU_COUNT
make install
