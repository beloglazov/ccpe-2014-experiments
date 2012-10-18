#!/bin/sh

for i in {1..8}
do
    nova boot --image ubuntu-spe3 --flavor pico --key_name test "ubuntu$i"
done
