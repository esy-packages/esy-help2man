#! /bin/bash

pwd
mkdir _test
cd _test

INCLUDE=$cur__install/include

echo "include..."
ls -a $INCLUDE
echo "lib.."
ls -a $cur__lib

gcc ./../test.c -o ./test.exe -I$INCLUDE -L$cur__lib -lssl -lcrypto

export PATH=$PATH:$cur__bin:$cur__lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$cur__lib

echo "Augmented path: $PATH"

echo "Copying binaries..."
cp $cur__bin/*.dll .

echo "Test executable path:"
ls -a .

./test.exe
