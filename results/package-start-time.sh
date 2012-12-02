#!/bin/sh

if [ $# -ne 1 ]
then
    echo "You must specify the name of the package archive"
    exit 1
fi


mkdir "tmp-$1"
cp $1 "tmp-$1"
cd "tmp-$1"
tar xzf $1
name=${1%.tar.gz}

cat "${name}/controller/global-manager.log" | grep Starting | cut -d ',' -f 1
cd ../
rm -rf "tmp-$1"
