#!/bin/bash
#****************************************************************************
#* build.sh
#* 
#* Conda package build script for Z3
#****************************************************************************

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

cwd=`pwd`
CFLAGS_ORIG=${CFLAGS}

cd ${cwd}/z3
python scripts/mk_make.py
if test $? -ne 0; then exit 1; fi

cd build

make -j${CPU_COUNT}
if test $? -ne 0; then exit 1; fi

make PREFIX=${PREFIX} install
if test $? -ne 0; then exit 1; fi
