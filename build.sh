#! /bin/bash

if [ $2 == 'windows' ]
then
    for mingw_tool in $(ls /usr/bin/x86_64-w64-mingw32-*)
    do
        tool_name=${mingw_tool##/usr/bin/x86_64-w64-mingw32-}
        command -v $tool_name >/dev/null 2>&1 || ln -s $mingw_tool ${tool_name%%.exe}
    done
fi

ln -s /usr/bin/true makeinfo # disable building docs https://stackoverflow.com/questions/48071270/how-to-disable-automake-docs

PATH=$PWD:$PATH

cd help2man-1.47.8/
./configure --prefix=$1
make
