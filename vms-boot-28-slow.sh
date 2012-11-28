#!/bin/sh

for i in {1..28}
do
    nova boot --image spe-ubuntu2 --flavor pico --key_name test `printf ubuntu%02d $i`
    sleep 5
done
