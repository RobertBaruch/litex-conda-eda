#!/bin/bash
#****************************************************************************
#* build.sh
#* 
#* Conda package build script for Boolector
#****************************************************************************

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

cwd=`pwd`
CFLAGS_ORIG=${CFLAGS}

unset CFLAGS

cd ${cwd}/boolector

echo "CFLAGS=${CFLAGS}"
./contrib/setup-btor2tools.sh
if test $? -ne 0; then exit 1; fi

./contrib/setup-lingeling.sh
if test $? -ne 0; then exit 1; fi

echo "CFLAGS=${CFLAGS}"
./configure.sh --prefix ${PREFIX}
if test $? -ne 0; then exit 1; fi

cd build

make -j${CPU_COUNT}
if test $? -ne 0; then exit 1; fi

make install
if test $? -ne 0; then exit 1; fi

