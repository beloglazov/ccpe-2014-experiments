#!/bin/sh

for i in {1..8}
do
    nova delete "ubuntu$i"
done
