#!/bin/sh

for i in {1..8}
do
    nova boot --image ubuntu-spe2 --flavor nano384 --key_name test "ubuntu$i"
done
