if %ARCH% EQU 32 (
  set VL_ARCH="win32"
  call "%VCINSTALLDIR%\vcvarsall.bat" x86
) else (
  set VL_ARCH="win64"
  call "%VCINSTALLDIR%\vcvarsall.bat" amd64
)

cd z3

if %ARCH% EQU 32 (
    python scripts/mk_make.py
) else (
    python scripts/mk_make.py -x
)

cd build
nmake
