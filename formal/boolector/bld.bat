ECHO on

set MSYSTEM=MINGW%ARCH%

set CC=%GCC_ARCH%-gcc
set CXX=%GCC_ARCH%-g++
set HOST_FLAGS=--host=%GCC_ARCH%

cd boolector

./contrib/setup-btor2tools.sh
if test $? -ne 0; then exit 1; fi

./contrib/setup-lingeling.sh
if test $? -ne 0; then exit 1; fi

mkdir build
cd build
cmake .. -DIS_WINDOWS_BUILD=1 -G "MSYS Makefiles"
if test $? -ne 0; then exit 1; fi

make -j2
ls -l
