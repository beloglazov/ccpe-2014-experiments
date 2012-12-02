#!/bin/sh

if [ $# -ne 1 ]
then
    echo "You must specify the name of the package as an argument"
    exit 1
fi

./db-dump.sh
mkdir $1
mv db.tar.gz $1
cd $1

mkdir compute1
mkdir compute2
mkdir compute3
mkdir compute4
mkdir controller

scp compute1:/var/log/neat/* compute1/
scp compute2:/var/log/neat/* compute2/
scp compute3:/var/log/neat/* compute3/
scp compute4:/var/log/neat/* compute4/
cp /var/log/neat/* controller/

cp /etc/neat/neat.conf ./

cd ../
tar czf $1.tar.gz $1
rm -rf $1

./package-start-time.sh $1.tar.gz
