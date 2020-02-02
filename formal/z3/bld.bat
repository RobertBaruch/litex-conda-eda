ECHO on

mkdir %PREFIX%\bin
copy z3\include\* %LIBRARY_INC%
if errorlevel 1 exit 1
copy z3\bin\* %LIBRARY_BIN%
if errorlevel 1 exit 1

z3 --version
