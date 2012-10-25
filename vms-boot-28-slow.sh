#!/bin/sh

for i in {1..28}
do
    nova boot --image ubuntu-spe7 --flavor pico --key_name test "ubuntu$i"
    sleep 5
done
